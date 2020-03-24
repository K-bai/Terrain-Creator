# 函数参数：#v_1, #v_2
# 表示作为随机坐标的种子
# 函数返回值：#v_1
# 表示返回的随机数
# 返回值的范围在0~8192之间

# params: #v_1, #v_2
# v_1-2: integer coordinate
# return values: #v_1
# v_1-2: random number (hash) (0-8192)

# 噪声种子 Noise seed
scoreboard players set #v_seed pl_sys 4348
# 计算 Calculate
execute store result score #v_rxy_t pl_sys run scoreboard players get #v_seed pl_sys
scoreboard players operation #v_rxy_t pl_sys %= #n8192 pl_sys
scoreboard players operation #v_1 pl_sys %= #n8192 pl_sys
scoreboard players operation #v_2 pl_sys %= #n8192 pl_sys
scoreboard players add #v_rxy_t pl_sys 1
scoreboard players add #v_1 pl_sys 1
scoreboard players add #v_2 pl_sys 1

scoreboard players operation #v_rxy_t pl_sys *= #v_1 pl_sys
scoreboard players operation #v_rxy_t pl_sys %= #n8192 pl_sys
scoreboard players operation #v_rxy_t pl_sys *= #v_2 pl_sys
scoreboard players operation #v_rxy_t pl_sys %= #n8192 pl_sys

# 调用随机函数 Call random function
execute store result score #v_1 pl_sys run scoreboard players get #v_rxy_t pl_sys
function perlin:random/number