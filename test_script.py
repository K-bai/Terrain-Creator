import math
import random
from PIL import Image
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def dis(self):
        return math.sqrt(self.x**2+self.y**2)
    def normalize(self):
        return Vec(self.x/self.dis(),self.y/self.dis())
    def m_distance(self):
        return abs(self.x)+abs(self.y)
        #return self.dis()
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
    seed=4345
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
    return Vec(t*10000/8192, t2*10000/8192)

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
    #print('{},{},{},{},{},{},{}'.format(p1,p2,p3,p4,P,A,B))
    return P

def noiseN(x, y):
    #return noise(x,y)
    return (noise(x,y)+0.5*noise(2*x,2*y)+0.25*noise(4*x,4*y))/1.75

def noiseW(x, y):
    r = 10000
    xp = x%r
    yp = y%r
    p = Vec(xp, yp)
    xi = math.floor(x/r)
    yi = math.floor(y/r)
    p0 = rand_point(xi, yi)+Vec(0,0)
    p1 = rand_point(xi, yi+1)+Vec(0,r)
    p2 = rand_point(xi, yi-1)+Vec(0,-r)
    p3 = rand_point(xi+1, yi)+Vec(r,0)
    p4 = rand_point(xi+1, yi+1)+Vec(r,r)
    p5 = rand_point(xi+1, yi-1)+Vec(r,-r)
    p6 = rand_point(xi-1, yi)+Vec(-r,0)
    p7 = rand_point(xi-1, yi+1)+Vec(-r,r)
    p8 = rand_point(xi-1, yi-1)+Vec(-r,-r)
    dis0 = (p-p0).dis()
    dis1 = (p-p1).dis()
    dis2 = (p-p2).dis()
    dis3 = (p-p3).dis()
    dis4 = (p-p4).dis()
    dis5 = (p-p5).dis()
    dis6 = (p-p6).dis()
    dis7 = (p-p7).dis()
    dis8 = (p-p8).dis()
    min_dis = dis0
    min_dis2 = dis0
    if (dis1<min_dis):
        min_dis=dis1
    if (dis2<min_dis):
        min_dis=dis2
    if (dis3<min_dis):
        min_dis=dis3
    if (dis4<min_dis):
        min_dis=dis4
    if (dis5<min_dis):
        min_dis=dis5
    if (dis6<min_dis):
        min_dis=dis6
    if (dis7<min_dis):
        min_dis=dis7
    if (dis8<min_dis):
        min_dis=dis8
    if (min_dis==dis0):
        min_dis2=dis1
    if (min_dis!=dis0 and dis0<min_dis2):
        min_dis2=dis0
    if (min_dis!=dis1 and dis1<min_dis2):
        min_dis2=dis1
    if (min_dis!=dis2 and dis2<min_dis2):
        min_dis2=dis2
    if (min_dis!=dis3 and dis3<min_dis2):
        min_dis2=dis3
    if (min_dis!=dis4 and dis4<min_dis2):
        min_dis2=dis4
    if (min_dis!=dis5 and dis5<min_dis2):
        min_dis2=dis5
    if (min_dis!=dis6 and dis6<min_dis2):
        min_dis2=dis6
    if (min_dis!=dis7 and dis7<min_dis2):
        min_dis2=dis7
    if (min_dis!=dis8 and dis8<min_dis2):
        min_dis2=dis8
    if (min_dis==dis0):
        n=p0
        m=Vec(0,0)
    if (min_dis==dis1):
        n=p1
        m=Vec(0,1)
    if (min_dis==dis2):
        n=p2
        m=Vec(0,-1)
    if (min_dis==dis3):
        n=p3
        m=Vec(1,0)
    if (min_dis==dis4):
        n=p4
        m=Vec(1,1)
    if (min_dis==dis5):
        n=p5
        m=Vec(1,-1)
    if (min_dis==dis6):
        n=p6
        m=Vec(-1,0)
    if (min_dis==dis7):
        n=p7
        m=Vec(-1,1)
    if (min_dis==dis8):
        n=p8
        m=Vec(-1,-1)
    if (min_dis2==dis0):
        n2=p0
    if (min_dis2==dis1):
        n2=p1
    if (min_dis2==dis2):
        n2=p2
    if (min_dis2==dis3):
        n2=p3
    if (min_dis2==dis4):
        n2=p4
    if (min_dis2==dis5):
        n2=p5
    if (min_dis2==dis6):
        n2=p6
    if (min_dis2==dis7):
        n2=p7
    if (min_dis2==dis8):
        n2=p8
    dis=(p-((n+n2)*0.5))*((n-n2).normalize())
    if (dis<1000):
        return 0
    return rand_color(m.x+xi, m.y+yi)

print(noiseW(18872,361))
print(rand_xy(1, 1))


im = Image.new('L',(255,255))
min_color = 255
max_color = 0
for y in range(255):
    for x in range(255):
        color = int(noiseW(x*10000*0.01,y*10000*0.01)*255/10000)
        if color > max_color:
            max_color = color
        if color < min_color:
            min_color = color
        im.putpixel((x,y),color)
im.show()
print(max_color)
print(min_color)
