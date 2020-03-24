# 函数参数：#v_1, #v_2
# 表示要求的整数坐标
# 函数返回值：#v_1, #v_2
# 表示对应坐标晶格内的随机点坐标值 范围在0~10000之间

# params: #v_1, #v_2
# v_1-2: integer coordinate
# return values: #v_1, #v_2
# v_1-2: random point (0-10000)

function perlin:random/xy
execute store result score #v_2 pl_sys run scoreboard players get #v_1 pl_sys
function perlin:random/number
scoreboard players operation #v_1 pl_sys *= #n10000 pl_sys
scoreboard players operation #v_2 pl_sys *= #n10000 pl_sys
scoreboard players operation #v_1 pl_sys /= #n8192 pl_sys
scoreboard players operation #v_2 pl_sys /= #n8192 pl_sys