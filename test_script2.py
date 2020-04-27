import math
from PIL import Image
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def length(self):
        return math.sqrt(self.x**2+self.y**2)
    def normalize(self):
        return Vec(self.x/self.length(),self.y/self.length())
    def m_distance(self):
        return abs(self.x)+abs(self.y)
    def __add__(self, other):
        return Vec(self.x+other.x, self.y+other.y)
    def __sub__(self, other):
        return Vec(self.x-other.x, self.y-other.y)
    def __mul__(self, other):
        if isinstance(other, Vec):
            return self.x*other.x + self.y*other.y
        else:
            return Vec(self.x*other, self.y*other)
    def __repr__(self):
        return '({},{})'.format(self.x,self.y)

def rand(seed):
    return int((seed * 214013 + 2531011)/65536)%8192

vec_list = [
    Vec(-10000,0),
    Vec(-8660,-5000),
    Vec(-8660,5000),
    Vec(5000,-8660),
    Vec(10000,0),
    Vec(8660,5000),
    Vec(-5000,8660),
    Vec(0,10000),
    Vec(0,-10000),
    Vec(8660,-5000),
    Vec(-5000,-8660),
    Vec(5000,8660),
]

def rand_xy(x, y):
    seed=4348
    t = (seed%8192+1) * (x%8192+1)
    t = (t%8192) * (y%8192+1)
    t = rand(t%8192)
    return t

def rand_vec(x, y):
    t = rand_xy(x,y)%len(vec_list)
    return vec_list[t]

def rand_point(x, y):
    t = rand_xy(x,y)
    t2 = rand(t)
    return Vec(int(t2*10000/8192), int(t*10000/8192))

def rand_color(x, y):
    t = int(rand_xy(x,y)*10000/8192)
    return t

def noise(x, y):
    r = 10000
    xp = x%r
    yp = y%r
    xi = math.floor(x/r)
    yi = math.floor(y/r)
    # 插值
    p1 = rand_vec(xi,yi)*(Vec(xp,yp)-Vec(0,0))/r
    p2 = rand_vec(xi,yi+1)*(Vec(xp,yp)-Vec(0,r))/r
    p3 = rand_vec(xi+1,yi)*(Vec(xp,yp)-Vec(r,0))/r
    p4 = rand_vec(xi+1,yi+1)*(Vec(xp,yp)-Vec(r,r))/r
    xp = 3*math.floor(math.floor(xp*xp)/10000)-2*math.floor(math.floor(math.floor(math.floor(xp*xp)/10000)*xp)/10000)
    yp = 3*yp*yp/10000-2*yp*yp*yp/10000/10000
    A = p1*(r-xp)/r+p3*xp/r
    B = p2*(r-xp)/r+p4*xp/r
    P = A*(r-yp)/r+B*yp/r
    P = (P+r)/2
    return P




def noiseW_m(x, y):
    r = 10000
    xp = x%r
    yp = y%r
    p = Vec(xp, yp)
    xi = math.floor(x/r)
    yi = math.floor(y/r)
    p_l = [
        Vec(0,0),
        Vec(0,1),
        Vec(0,-1),
        Vec(1,0),
        Vec(1,1),
        Vec(1,-1),
        Vec(-1,0),
        Vec(-1,1),
        Vec(-1,-1)
    ]
    # 获得周围9方块特征点
    p_a = []
    for i in range(9):
        p_a.append(rand_point(xi+p_l[i].x, yi+p_l[i].y)+p_l[i]*r)
    # 计算与特征点的距离
    dis_l = []
    for i in range(9):
        dis_l.append((p-p_a[i]).length())
    # 找最小点和次小点
    sorted_dis = sorted(enumerate(dis_l), key=lambda x: x[1])
    # 计算距中线距离
    middle_dis=(p-((p_a[sorted_dis[0][0]]+p_a[sorted_dis[1][0]])*0.5))*((p_a[sorted_dis[0][0]]-p_a[sorted_dis[1][0]]).normalize())
    # 返回本区块id, 最近区块id, 距中线距离
    current_id = rand_color(p_l[sorted_dis[0][0]].x+xi, p_l[sorted_dis[0][0]].y+yi)
    neighbor_id = rand_color(p_l[sorted_dis[1][0]].x+xi, p_l[sorted_dis[1][0]].y+yi)
    return (current_id, neighbor_id, middle_dis)

def noiseW(x, y):
    r = noiseW_m(x, y)
    if (r[2]<1000):
        return 0
    else:
        return r[0]

def wave(t):
    # 三次函数波
    # 0-0.5: (3(2t)^2-2(2t)^3-0.5)*2 -> -1 + (24 - 32 t) t^2
    # 0.5-1: (3(2x-2)^2+2(2x-2)^3-0.5)*2 -> -9 + x (48 + x (-72 + 32 x))
    n = t%1000
    if (n<500):
        return int(-(n*n*n)/31250)+int((3*n*n)/125)-1000
        #return n-2500
    else:
        return int((n*n*n)/31250)-int((9*n*n)/125)+48*n-9000
def wave_pos(x, y):
    wave_length = 70
    strength = 8
    offset_x = int(strength*int(wave(int(y*1000/wave_length)))/1000)
    offset_y = int(strength*int(wave(int(x*1000/wave_length+500)))/1000)
    return (x+offset_x, y+offset_y)

def fade(start, end, x, min_t, max_t):
    n = (x-start)/(end-start)
    r = 3*n*n-2*n*n*n
    r = r*(max_t-min_t)+min_t
    return r
def fade2(start, end, x, min_t, max_t):
    n = (x-start)/(end-start)
    r = -n*n+2*n
    r = n*(max_t-min_t)+min_t
    return r


# 生成地形图思路：
# 扭曲坐标计算worley噪声，取得本区块和相邻最近区块噪声值，距中线距离
# 原坐标计算perlin噪声
# 根据噪声值计算区块高度：
# 距中线距离大于1500高度不变
# 1500-1000之间平滑至海平面高度
# 0-1000从海平面高度平滑至海平面高度-6
# 叠加perlin噪声：
# 距中线距离大于1500直接叠加
# 1500-1000之间从1倍叠加平滑至0倍叠加
# 0-1000不叠加

# 生物群系与高度表
biome_list = (
    (0, 10, 4, 2, 200, 400),#ocean
    (1, 30, 10, 3, 200, 600),#plain
    (2, 60, 15, 5, 150, 450),#mountain
    (3, 40, 10 ,5, 200, 400),#hill
)

def terrain(x, y):
    # 计算噪声值
    pos_w = wave_pos(x, y)
    pos_w = (pos_w[0] + 200, pos_w[1] + 200)
    #print(pos_w)
    worley = noiseW_m(pos_w[0]*50, pos_w[1]*50)
    #print(worley)
    biome_id = worley[0] % len(biome_list)
    #print(biome_id)
    biome_id_l = worley[1] % len(biome_list)
    ampt1 = biome_list[biome_id][2]
    ampt2 = biome_list[biome_id][3]
    scl1 = biome_list[biome_id][4]
    scl2 = biome_list[biome_id][5]
    biome_h = biome_list[biome_id][1]
    perlin = int((int(noise(x*scl1, y*scl1)*255/10000)-126)*ampt1/80)
    #print(noise(x*scl1, y*scl1))
    perlin += int((int(noise(x*scl2, y*scl2)*255/10000)-126)*ampt2/80)
    #print(noise(x*scl2, y*scl2))
    # 计算生物群系高度和叠加系数
    river_h = 30
    river_d = 7
    factor = 1000
    if (biome_id!=0 and worley[2]>500 and worley[2]<1500):
        biome_h = fade2(500, 1500, worley[2], river_h, biome_h)
        factor = fade2(500, 1500, worley[2], 0, 1000)
    elif (biome_id!=0 and worley[2]<=500):
        biome_h = fade(0, 500, worley[2], river_h-river_d, river_h)
        factor = 0
    elif (biome_id==0 and worley[2]<1500):
        # 如果是海重新计算叠加系数
        biome_h = fade2(0, 1500, worley[2], river_h-river_d, biome_h)
        factor = fade2(0, 1500, worley[2], 0, 1000)
    # 叠加
    #print(biome_h)
    #print(factor)
    biome_h = biome_h+factor/1000*(perlin)
    #print('final: {}'.format(biome_h))
    return biome_h


print(noiseW_m(-550,1250))
sum = 0
max_t = 0
min_t = 999

im = Image.new('L',(255,255))
for y in range(255):
    for x in range(255):
        pos = wave_pos(x, y)
        color = int(noiseW(x*300, y*300)*255/10000)
        #color = int((noise(x*10000*0.02, y*10000*0.02)+0.3*noise(x*10000*0.06, y*10000*0.06))*255/13000)
        #color = int((noise(x*10000*0.4, y*10000*0.4))*255/10000)
        #color = int(terrain(x,y))
        sum += color
        if (color<min_t):
            min_t=color
        if (color>max_t):
            max_t=color
        im.putpixel((x,y),color)
im.show()
im.save("test2.png")

print('average: {}'.format(sum/(255*255)))
print('max: {}'.format(max_t))
print('min: {}'.format(min_t))

