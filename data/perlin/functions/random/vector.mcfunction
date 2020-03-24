# 函数参数：#v_1, #v_2
# 表示要求的整数坐标
# 函数返回值：#v_1, #v_2
# 表示对应坐标返回的随机向量值

# params: #v_1, #v_2
# v_1-2: integer coordinate
# return values: #v_1, #v_2
# v_1-2: random vector

function perlin:random/xy
execute store result score #v_rvec_t pl_sys run scoreboard players get #v_1 pl_sys

# 选择向量并返回 Select a vector
scoreboard players operation #v_rvec_t pl_sys %= #n12 pl_sys
execute if score #v_rvec_t pl_sys matches 0 run scoreboard players operation #v_1 pl_sys = #v_rvec_v0x pl_sys
execute if score #v_rvec_t pl_sys matches 0 run scoreboard players operation #v_2 pl_sys = #v_rvec_v0y pl_sys
execute if score #v_rvec_t pl_sys matches 1 run scoreboard players operation #v_1 pl_sys = #v_rvec_v1x pl_sys
execute if score #v_rvec_t pl_sys matches 1 run scoreboard players operation #v_2 pl_sys = #v_rvec_v1y pl_sys
execute if score #v_rvec_t pl_sys matches 2 run scoreboard players operation #v_1 pl_sys = #v_rvec_v2x pl_sys
execute if score #v_rvec_t pl_sys matches 2 run scoreboard players operation #v_2 pl_sys = #v_rvec_v2y pl_sys
execute if score #v_rvec_t pl_sys matches 3 run scoreboard players operation #v_1 pl_sys = #v_rvec_v3x pl_sys
execute if score #v_rvec_t pl_sys matches 3 run scoreboard players operation #v_2 pl_sys = #v_rvec_v3y pl_sys
execute if score #v_rvec_t pl_sys matches 4 run scoreboard players operation #v_1 pl_sys = #v_rvec_v4x pl_sys
execute if score #v_rvec_t pl_sys matches 4 run scoreboard players operation #v_2 pl_sys = #v_rvec_v4y pl_sys
execute if score #v_rvec_t pl_sys matches 5 run scoreboard players operation #v_1 pl_sys = #v_rvec_v5x pl_sys
execute if score #v_rvec_t pl_sys matches 5 run scoreboard players operation #v_2 pl_sys = #v_rvec_v5y pl_sys
execute if score #v_rvec_t pl_sys matches 6 run scoreboard players operation #v_1 pl_sys = #v_rvec_v6x pl_sys
execute if score #v_rvec_t pl_sys matches 6 run scoreboard players operation #v_2 pl_sys = #v_rvec_v6y pl_sys
execute if score #v_rvec_t pl_sys matches 7 run scoreboard players operation #v_1 pl_sys = #v_rvec_v7x pl_sys
execute if score #v_rvec_t pl_sys matches 7 run scoreboard players operation #v_2 pl_sys = #v_rvec_v7y pl_sys
execute if score #v_rvec_t pl_sys matches 8 run scoreboard players operation #v_1 pl_sys = #v_rvec_v8x pl_sys
execute if score #v_rvec_t pl_sys matches 8 run scoreboard players operation #v_2 pl_sys = #v_rvec_v8y pl_sys
execute if score #v_rvec_t pl_sys matches 9 run scoreboard players operation #v_1 pl_sys = #v_rvec_v9x pl_sys
execute if score #v_rvec_t pl_sys matches 9 run scoreboard players operation #v_2 pl_sys = #v_rvec_v9y pl_sys
execute if score #v_rvec_t pl_sys matches 10 run scoreboard players operation #v_1 pl_sys = #v_rvec_v10x pl_sys
execute if score #v_rvec_t pl_sys matches 10 run scoreboard players operation #v_2 pl_sys = #v_rvec_v10y pl_sys
execute if score #v_rvec_t pl_sys matches 11 run scoreboard players operation #v_1 pl_sys = #v_rvec_v11x pl_sys
execute if score #v_rvec_t pl_sys matches 11 run scoreboard players operation #v_2 pl_sys = #v_rvec_v11y pl_sys
