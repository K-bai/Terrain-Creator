# 函数参数：#v_1, #v_2
# 表示要求的整数坐标
# 函数返回值：#v_1, #v_2
# 分别表示对应坐标返回的Worley噪声值、对应坐标在最近两区块中心连线的位置（距本区块中心距离百分比）
# 精确至小数点后4位（12变量传入时放大10000倍）

# param: #v_1, #v_2
# v_1-2: integer coordinate (multiply by 10000)
# return values: #v_1, #v_2
# v_1: worley noise values (0-10000)
# v_2: distance to midperpendicular of the two nearest points

# 取xy变量整数位与小数位 Get rounded coordinate and decimal places
execute store result score #v_nsw_xp pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_yp pl_sys run scoreboard players get #v_2 pl_sys
execute store result score #v_nsw_xi pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_yi pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players operation #v_nsw_xp pl_sys %= #n10000 pl_sys
scoreboard players operation #v_nsw_yp pl_sys %= #n10000 pl_sys
scoreboard players operation #v_nsw_xi pl_sys /= #n10000 pl_sys
scoreboard players operation #v_nsw_yi pl_sys /= #n10000 pl_sys


# 得到九个晶格内随机点坐标 Get random points in nine neighbor cell 
execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
function perlin:random/point
execute store result score #v_nsw_p0x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p0y pl_sys run scoreboard players get #v_2 pl_sys

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players add #v_2 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p1x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p1y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players add #v_nsw_p1y pl_sys 10000

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players remove #v_2 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p2x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p2y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players remove #v_nsw_p2y pl_sys 10000


execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players add #v_1 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p3x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p3y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players add #v_nsw_p3x pl_sys 10000

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players add #v_1 pl_sys 1
scoreboard players add #v_2 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p4x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p4y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players add #v_nsw_p4x pl_sys 10000
scoreboard players add #v_nsw_p4y pl_sys 10000

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players add #v_1 pl_sys 1
scoreboard players remove #v_2 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p5x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p5y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players add #v_nsw_p5x pl_sys 10000
scoreboard players remove #v_nsw_p5y pl_sys 10000


execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players remove #v_1 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p6x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p6y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players remove #v_nsw_p6x pl_sys 10000

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players remove #v_1 pl_sys 1
scoreboard players add #v_2 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p7x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p7y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players remove #v_nsw_p7x pl_sys 10000
scoreboard players add #v_nsw_p7y pl_sys 10000

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_xi pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_yi pl_sys
scoreboard players remove #v_1 pl_sys 1
scoreboard players remove #v_2 pl_sys 1
function perlin:random/point
execute store result score #v_nsw_p8x pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_nsw_p8y pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players remove #v_nsw_p8x pl_sys 10000
scoreboard players remove #v_nsw_p8y pl_sys 10000


# 计算距离平方 Calculate the square of the distance of current point and last nine random point
execute store result score #v_nsw_dis0 pl_sys run scoreboard players get #v_nsw_p0x pl_sys
execute store result score #v_nsw_dis1 pl_sys run scoreboard players get #v_nsw_p1x pl_sys
execute store result score #v_nsw_dis2 pl_sys run scoreboard players get #v_nsw_p2x pl_sys
execute store result score #v_nsw_dis3 pl_sys run scoreboard players get #v_nsw_p3x pl_sys
execute store result score #v_nsw_dis4 pl_sys run scoreboard players get #v_nsw_p4x pl_sys
execute store result score #v_nsw_dis5 pl_sys run scoreboard players get #v_nsw_p5x pl_sys
execute store result score #v_nsw_dis6 pl_sys run scoreboard players get #v_nsw_p6x pl_sys
execute store result score #v_nsw_dis7 pl_sys run scoreboard players get #v_nsw_p7x pl_sys
execute store result score #v_nsw_dis8 pl_sys run scoreboard players get #v_nsw_p8x pl_sys
execute store result score #v_nsw_vdis0 pl_sys run scoreboard players get #v_nsw_p0y pl_sys
execute store result score #v_nsw_vdis1 pl_sys run scoreboard players get #v_nsw_p1y pl_sys
execute store result score #v_nsw_vdis2 pl_sys run scoreboard players get #v_nsw_p2y pl_sys
execute store result score #v_nsw_vdis3 pl_sys run scoreboard players get #v_nsw_p3y pl_sys
execute store result score #v_nsw_vdis4 pl_sys run scoreboard players get #v_nsw_p4y pl_sys
execute store result score #v_nsw_vdis5 pl_sys run scoreboard players get #v_nsw_p5y pl_sys
execute store result score #v_nsw_vdis6 pl_sys run scoreboard players get #v_nsw_p6y pl_sys
execute store result score #v_nsw_vdis7 pl_sys run scoreboard players get #v_nsw_p7y pl_sys
execute store result score #v_nsw_vdis8 pl_sys run scoreboard players get #v_nsw_p8y pl_sys
scoreboard players operation #v_nsw_dis0 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis1 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis2 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis3 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis4 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis5 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis6 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis7 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_dis8 pl_sys -= #v_nsw_xp pl_sys
scoreboard players operation #v_nsw_vdis0 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis1 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis2 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis3 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis4 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis5 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis6 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis7 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_vdis8 pl_sys -= #v_nsw_yp pl_sys
scoreboard players operation #v_nsw_dis0 pl_sys *= #v_nsw_dis0 pl_sys
scoreboard players operation #v_nsw_dis1 pl_sys *= #v_nsw_dis1 pl_sys
scoreboard players operation #v_nsw_dis2 pl_sys *= #v_nsw_dis2 pl_sys
scoreboard players operation #v_nsw_dis3 pl_sys *= #v_nsw_dis3 pl_sys
scoreboard players operation #v_nsw_dis4 pl_sys *= #v_nsw_dis4 pl_sys
scoreboard players operation #v_nsw_dis5 pl_sys *= #v_nsw_dis5 pl_sys
scoreboard players operation #v_nsw_dis6 pl_sys *= #v_nsw_dis6 pl_sys
scoreboard players operation #v_nsw_dis7 pl_sys *= #v_nsw_dis7 pl_sys
scoreboard players operation #v_nsw_dis8 pl_sys *= #v_nsw_dis8 pl_sys
scoreboard players operation #v_nsw_vdis0 pl_sys *= #v_nsw_vdis0 pl_sys
scoreboard players operation #v_nsw_vdis1 pl_sys *= #v_nsw_vdis1 pl_sys
scoreboard players operation #v_nsw_vdis2 pl_sys *= #v_nsw_vdis2 pl_sys
scoreboard players operation #v_nsw_vdis3 pl_sys *= #v_nsw_vdis3 pl_sys
scoreboard players operation #v_nsw_vdis4 pl_sys *= #v_nsw_vdis4 pl_sys
scoreboard players operation #v_nsw_vdis5 pl_sys *= #v_nsw_vdis5 pl_sys
scoreboard players operation #v_nsw_vdis6 pl_sys *= #v_nsw_vdis6 pl_sys
scoreboard players operation #v_nsw_vdis7 pl_sys *= #v_nsw_vdis7 pl_sys
scoreboard players operation #v_nsw_vdis8 pl_sys *= #v_nsw_vdis8 pl_sys
scoreboard players operation #v_nsw_dis0 pl_sys += #v_nsw_vdis0 pl_sys
scoreboard players operation #v_nsw_dis1 pl_sys += #v_nsw_vdis1 pl_sys
scoreboard players operation #v_nsw_dis2 pl_sys += #v_nsw_vdis2 pl_sys
scoreboard players operation #v_nsw_dis3 pl_sys += #v_nsw_vdis3 pl_sys
scoreboard players operation #v_nsw_dis4 pl_sys += #v_nsw_vdis4 pl_sys
scoreboard players operation #v_nsw_dis5 pl_sys += #v_nsw_vdis5 pl_sys
scoreboard players operation #v_nsw_dis6 pl_sys += #v_nsw_vdis6 pl_sys
scoreboard players operation #v_nsw_dis7 pl_sys += #v_nsw_vdis7 pl_sys
scoreboard players operation #v_nsw_dis8 pl_sys += #v_nsw_vdis8 pl_sys


# 查找最小值点和次小值点 Find the nearest and the second nearest point
execute if score #v_nsw_dis0 pl_sys < #v_nsw_dis1 pl_sys store result score #v_nsw_min pl_sys run scoreboard players get #v_nsw_dis0 pl_sys
execute if score #v_nsw_dis0 pl_sys < #v_nsw_dis1 pl_sys store result score #v_nsw_min2 pl_sys run scoreboard players get #v_nsw_dis1 pl_sys
execute if score #v_nsw_dis0 pl_sys >= #v_nsw_dis1 pl_sys store result score #v_nsw_min pl_sys run scoreboard players get #v_nsw_dis1 pl_sys
execute if score #v_nsw_dis0 pl_sys >= #v_nsw_dis1 pl_sys store result score #v_nsw_min2 pl_sys run scoreboard players get #v_nsw_dis0 pl_sys

execute if score #v_nsw_dis2 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis2 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis2 pl_sys
execute if score #v_nsw_dis2 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis2 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis2 pl_sys
execute if score #v_nsw_dis3 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis3 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis3 pl_sys
execute if score #v_nsw_dis3 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis3 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis3 pl_sys
execute if score #v_nsw_dis4 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis4 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis4 pl_sys
execute if score #v_nsw_dis4 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis4 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis4 pl_sys
execute if score #v_nsw_dis5 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis5 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis5 pl_sys
execute if score #v_nsw_dis5 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis5 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis5 pl_sys
execute if score #v_nsw_dis6 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis6 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis6 pl_sys
execute if score #v_nsw_dis6 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis6 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis6 pl_sys
execute if score #v_nsw_dis7 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis7 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis7 pl_sys
execute if score #v_nsw_dis7 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis7 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis7 pl_sys
execute if score #v_nsw_dis8 pl_sys > #v_nsw_min pl_sys if score #v_nsw_dis8 pl_sys < #v_nsw_min2 pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_dis8 pl_sys
execute if score #v_nsw_dis8 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min2 pl_sys = #v_nsw_min pl_sys
execute if score #v_nsw_dis8 pl_sys < #v_nsw_min pl_sys run scoreboard players operation #v_nsw_min pl_sys = #v_nsw_dis8 pl_sys

scoreboard players set #v_nsw_min_x pl_sys 0
scoreboard players set #v_nsw_min_y pl_sys 0
scoreboard players set #v_nsw_min2_x pl_sys 0
scoreboard players set #v_nsw_min2_y pl_sys 0

execute if score #v_nsw_min pl_sys = #v_nsw_dis0 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p0x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis0 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p0y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis1 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p1x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis1 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p1y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis2 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p2x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis2 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p2y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis3 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p3x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis3 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p3y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis4 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p4x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis4 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p4y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis5 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p5x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis5 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p5y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis6 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p6x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis6 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p6y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis7 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p7x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis7 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p7y pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis8 pl_sys store result score #v_nsw_min_x pl_sys run scoreboard players get #v_nsw_p8x pl_sys
execute if score #v_nsw_min pl_sys = #v_nsw_dis8 pl_sys store result score #v_nsw_min_y pl_sys run scoreboard players get #v_nsw_p8y pl_sys

execute if score #v_nsw_min2 pl_sys = #v_nsw_dis0 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p0x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis0 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p0y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis1 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p1x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis1 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p1y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis2 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p2x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis2 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p2y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis3 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p3x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis3 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p3y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis4 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p4x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis4 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p4y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis5 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p5x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis5 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p5y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis6 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p6x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis6 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p6y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis7 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p7x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis7 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p7y pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis8 pl_sys store result score #v_nsw_min2_x pl_sys run scoreboard players get #v_nsw_p8x pl_sys
execute if score #v_nsw_min2 pl_sys = #v_nsw_dis8 pl_sys store result score #v_nsw_min2_y pl_sys run scoreboard players get #v_nsw_p8y pl_sys


# 计算与中线距离(x-(a+b)/2) Calculate the distance of current point and the midperpendicular
execute store result score #v_nsw_dis_x pl_sys run scoreboard players get #v_nsw_xp pl_sys
execute store result score #v_nsw_dis_y pl_sys run scoreboard players get #v_nsw_yp pl_sys

execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_min_x pl_sys
scoreboard players operation #v_1 pl_sys += #v_nsw_min2_x pl_sys
scoreboard players operation #v_1 pl_sys /= #n2 pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_min_y pl_sys
scoreboard players operation #v_2 pl_sys += #v_nsw_min2_y pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys

scoreboard players operation #v_nsw_dis_x pl_sys -= #v_1 pl_sys
scoreboard players operation #v_nsw_dis_y pl_sys -= #v_2 pl_sys

# 计算与中线距离((a-b)/(|a-b|)) Next step
execute store result score #v_nsw_dis2_x pl_sys run scoreboard players get #v_nsw_min_x pl_sys
execute store result score #v_nsw_dis2_y pl_sys run scoreboard players get #v_nsw_min_y pl_sys
scoreboard players operation #v_nsw_dis2_x pl_sys -= #v_nsw_min2_x pl_sys
scoreboard players operation #v_nsw_dis2_y pl_sys -= #v_nsw_min2_y pl_sys
execute store result score #v_1 pl_sys run scoreboard players get #v_nsw_dis2_x pl_sys
scoreboard players operation #v_1 pl_sys *= #v_1 pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_nsw_dis2_y pl_sys
scoreboard players operation #v_2 pl_sys *= #v_2 pl_sys
scoreboard players operation #v_1 pl_sys += #v_2 pl_sys

scoreboard players set #v_3 pl_sys 0
scoreboard players set #v_2 pl_sys 10000
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys
scoreboard players operation #v_3 pl_sys = #v_1 pl_sys
scoreboard players operation #v_3 pl_sys /= #v_2 pl_sys
scoreboard players operation #v_2 pl_sys += #v_3 pl_sys
scoreboard players operation #v_2 pl_sys /= #n2 pl_sys

scoreboard players operation #v_nsw_dis2_x pl_sys *= #n10000 pl_sys
scoreboard players operation #v_nsw_dis2_y pl_sys *= #n10000 pl_sys
scoreboard players operation #v_nsw_dis2_x pl_sys /= #v_2 pl_sys
scoreboard players operation #v_nsw_dis2_y pl_sys /= #v_2 pl_sys

# 计算与中线距离(二者点乘) Dot product
scoreboard players operation #v_nsw_dis_x pl_sys *= #v_nsw_dis2_x pl_sys
scoreboard players operation #v_nsw_dis_y pl_sys *= #v_nsw_dis2_y pl_sys
scoreboard players operation #v_nsw_dis_x pl_sys += #v_nsw_dis_y pl_sys
scoreboard players operation #v_nsw_dis_x pl_sys /= #n10000 pl_sys


# 计算对应数值 Output
scoreboard players operation #v_1 pl_sys = #v_nsw_min_x pl_sys
scoreboard players operation #v_2 pl_sys = #v_nsw_min_y pl_sys
scoreboard players operation #v_1 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_2 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_1 pl_sys += #v_nsw_xi pl_sys
scoreboard players operation #v_2 pl_sys += #v_nsw_yi pl_sys
function perlin:random/xy
scoreboard players operation #v_1 pl_sys *= #n10000 pl_sys
scoreboard players operation #v_1 pl_sys /= #n8192 pl_sys

scoreboard players operation #v_2 pl_sys = #v_nsw_dis_x pl_sys
