# 函数参数：#v_1， #v_2
# 表示要求的整数坐标
# 函数返回值：#v_1
# 表示对应坐标返回的perlin噪声值
# 精确至小数点后4位（12变量传入时放大10000倍）

# param: #v_1, #v_2
# v_1-2: integer coordinate (multiply by 10000)
# return values: #v_1
# v_1: perlin noise values (0-10000)

# 取xy变量整数位与小数位 Get rounded coordinate and decimal places
execute store result score #v_ns_xp pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_ns_yp pl_sys run scoreboard players get #v_2 pl_sys
execute store result score #v_ns_xi pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_ns_yi pl_sys run scoreboard players get #v_2 pl_sys
scoreboard players operation #v_ns_xp pl_sys %= #n10000 pl_sys
scoreboard players operation #v_ns_yp pl_sys %= #n10000 pl_sys
scoreboard players operation #v_ns_xi pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_yi pl_sys /= #n10000 pl_sys

# 获得四个角指向坐标的向量 Get vectors that directing four corners
execute store result score #v_ns_v1x pl_sys run scoreboard players get #v_ns_xp pl_sys
execute store result score #v_ns_v2x pl_sys run scoreboard players get #v_ns_xp pl_sys
execute store result score #v_ns_v3x pl_sys run scoreboard players get #v_ns_xp pl_sys
execute store result score #v_ns_v4x pl_sys run scoreboard players get #v_ns_xp pl_sys
execute store result score #v_ns_v1y pl_sys run scoreboard players get #v_ns_yp pl_sys
execute store result score #v_ns_v2y pl_sys run scoreboard players get #v_ns_yp pl_sys
execute store result score #v_ns_v3y pl_sys run scoreboard players get #v_ns_yp pl_sys
execute store result score #v_ns_v4y pl_sys run scoreboard players get #v_ns_yp pl_sys
scoreboard players remove #v_ns_v2y pl_sys 10000
scoreboard players remove #v_ns_v3x pl_sys 10000
scoreboard players remove #v_ns_v4x pl_sys 10000
scoreboard players remove #v_ns_v4y pl_sys 10000


# 计算四个角的随机坐标 并获得权重 Get random vectors of four corners and calculate weight
scoreboard players operation #v_1 pl_sys = #v_ns_xi pl_sys
scoreboard players operation #v_2 pl_sys = #v_ns_yi pl_sys
function perlin:random/vector
scoreboard players operation #v_ns_v1x pl_sys *= #v_1 pl_sys
scoreboard players operation #v_ns_v1y pl_sys *= #v_2 pl_sys
scoreboard players operation #v_ns_v1x pl_sys += #v_ns_v1y pl_sys

scoreboard players add #v_ns_yi pl_sys 1
scoreboard players operation #v_1 pl_sys = #v_ns_xi pl_sys
scoreboard players operation #v_2 pl_sys = #v_ns_yi pl_sys
function perlin:random/vector
scoreboard players operation #v_ns_v2x pl_sys *= #v_1 pl_sys
scoreboard players operation #v_ns_v2y pl_sys *= #v_2 pl_sys
scoreboard players operation #v_ns_v2x pl_sys += #v_ns_v2y pl_sys

scoreboard players add #v_ns_xi pl_sys 1
scoreboard players operation #v_1 pl_sys = #v_ns_xi pl_sys
scoreboard players operation #v_2 pl_sys = #v_ns_yi pl_sys
function perlin:random/vector
scoreboard players operation #v_ns_v4x pl_sys *= #v_1 pl_sys
scoreboard players operation #v_ns_v4y pl_sys *= #v_2 pl_sys
scoreboard players operation #v_ns_v4x pl_sys += #v_ns_v4y pl_sys

scoreboard players remove #v_ns_yi pl_sys 1
scoreboard players operation #v_1 pl_sys = #v_ns_xi pl_sys
scoreboard players operation #v_2 pl_sys = #v_ns_yi pl_sys
function perlin:random/vector
scoreboard players operation #v_ns_v3x pl_sys *= #v_1 pl_sys
scoreboard players operation #v_ns_v3y pl_sys *= #v_2 pl_sys
scoreboard players operation #v_ns_v3x pl_sys += #v_ns_v3y pl_sys

scoreboard players operation #v_ns_v1x pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_v2x pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_v3x pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_v4x pl_sys /= #n10000 pl_sys



# 缓冲插值 Fade function
execute store result score #v_ns_xu pl_sys run scoreboard players get #v_ns_xp pl_sys
scoreboard players operation #v_ns_xu pl_sys *= #v_ns_xu pl_sys
scoreboard players operation #v_ns_xu pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_xu pl_sys *= #n3 pl_sys
execute store result score #v_ns_xu2 pl_sys run scoreboard players get #v_ns_xp pl_sys
scoreboard players operation #v_ns_xu2 pl_sys *= #v_ns_xp pl_sys
scoreboard players operation #v_ns_xu2 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_xu2 pl_sys *= #v_ns_xp pl_sys
scoreboard players operation #v_ns_xu2 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_xu2 pl_sys *= #n2 pl_sys
scoreboard players operation #v_ns_xu pl_sys -= #v_ns_xu2 pl_sys

execute store result score #v_ns_yu pl_sys run scoreboard players get #v_ns_yp pl_sys
scoreboard players operation #v_ns_yu pl_sys *= #v_ns_yu pl_sys
scoreboard players operation #v_ns_yu pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_yu pl_sys *= #n3 pl_sys
execute store result score #v_ns_yu2 pl_sys run scoreboard players get #v_ns_yp pl_sys
scoreboard players operation #v_ns_yu2 pl_sys *= #v_ns_yp pl_sys
scoreboard players operation #v_ns_yu2 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_yu2 pl_sys *= #v_ns_yp pl_sys
scoreboard players operation #v_ns_yu2 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_yu2 pl_sys *= #n2 pl_sys
scoreboard players operation #v_ns_yu pl_sys -= #v_ns_yu2 pl_sys




# 线性插值 Lerp
scoreboard players set #v_ns_A pl_sys 10000
scoreboard players operation #v_ns_A pl_sys -= #v_ns_xu pl_sys
scoreboard players operation #v_ns_A pl_sys *= #v_ns_v1x pl_sys
scoreboard players operation #v_ns_A pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_v3x pl_sys *= #v_ns_xu pl_sys
scoreboard players operation #v_ns_v3x pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_A pl_sys += #v_ns_v3x pl_sys

scoreboard players set #v_ns_B pl_sys 10000
scoreboard players operation #v_ns_B pl_sys -= #v_ns_xu pl_sys
scoreboard players operation #v_ns_B pl_sys *= #v_ns_v2x pl_sys
scoreboard players operation #v_ns_B pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_v4x pl_sys *= #v_ns_xu pl_sys
scoreboard players operation #v_ns_v4x pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_B pl_sys += #v_ns_v4x pl_sys

scoreboard players set #v_1 pl_sys 10000
scoreboard players operation #v_1 pl_sys -= #v_ns_yu pl_sys
scoreboard players operation #v_1 pl_sys *= #v_ns_A pl_sys
scoreboard players operation #v_1 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ns_B pl_sys *= #v_ns_yu pl_sys
scoreboard players operation #v_ns_B pl_sys /= #n10000 pl_sys
scoreboard players operation #v_1 pl_sys += #v_ns_B pl_sys

# 修改最终范围 Change range
scoreboard players add #v_1 pl_sys 10000
scoreboard players operation #v_1 pl_sys /= #n2 pl_sys
