# 函数参数：#v_1, #v_2
# 表示要求的整数坐标 (scale:1)
# 函数返回值：#v_1, #v_2
# 分别表示高度及生物群系

# param: #v_1, #v_2
# v_1-2: integer coordinate (scale:1)
# return values: #v_1, #v_2
# v_1: height
# v_2: biome


# 保存坐标 Save input coordinate
execute store result score #v_ta_i1 pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_ta_i2 pl_sys run scoreboard players get #v_2 pl_sys

# 扭曲坐标 wave the coordinate
function perlin:wave
#tellraw @a ["wave n1: ", {"score":{"name":"#v_1","objective":"pl_sys"}}]
#tellraw @a ["wave n2: ", {"score":{"name":"#v_2","objective":"pl_sys"}}]
scoreboard players add #v_1 pl_sys 200
scoreboard players add #v_2 pl_sys 200
# 计算worley噪声 Worley noise
scoreboard players operation #v_1 pl_sys *= #v_preset_worley_f pl_sys
scoreboard players operation #v_2 pl_sys *= #v_preset_worley_f pl_sys
function perlin:noise_wm
# 保存worley结果 Save worley noise
execute store result score #v_ta_worley1 pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_ta_worley2 pl_sys run scoreboard players get #v_2 pl_sys

#tellraw @a ["worley n1: ", {"score":{"name":"#v_1","objective":"pl_sys"}}]
#tellraw @a ["worley n2: ", {"score":{"name":"#v_2","objective":"pl_sys"}}]

# 计算生物群系 Determine the biome
execute store result score #v_ta_biome_id pl_sys run scoreboard players get #v_ta_worley1 pl_sys
scoreboard players operation #v_ta_biome_id pl_sys %= #v_preset_biome_n pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 store result score #v_ta_biome_h pl_sys run scoreboard players get #v_preset_biome0_h pl_sys
execute if score #v_ta_biome_id pl_sys matches 1 store result score #v_ta_biome_h pl_sys run scoreboard players get #v_preset_biome1_h pl_sys
execute if score #v_ta_biome_id pl_sys matches 2 store result score #v_ta_biome_h pl_sys run scoreboard players get #v_preset_biome2_h pl_sys
execute if score #v_ta_biome_id pl_sys matches 3 store result score #v_ta_biome_h pl_sys run scoreboard players get #v_preset_biome3_h pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 store result score #v_ta_perlin_scl1 pl_sys run scoreboard players get #v_preset_biome0_p_scl1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 1 store result score #v_ta_perlin_scl1 pl_sys run scoreboard players get #v_preset_biome1_p_scl1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 2 store result score #v_ta_perlin_scl1 pl_sys run scoreboard players get #v_preset_biome2_p_scl1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 3 store result score #v_ta_perlin_scl1 pl_sys run scoreboard players get #v_preset_biome3_p_scl1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 store result score #v_ta_perlin_scl2 pl_sys run scoreboard players get #v_preset_biome0_p_scl2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 1 store result score #v_ta_perlin_scl2 pl_sys run scoreboard players get #v_preset_biome1_p_scl2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 2 store result score #v_ta_perlin_scl2 pl_sys run scoreboard players get #v_preset_biome2_p_scl2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 3 store result score #v_ta_perlin_scl2 pl_sys run scoreboard players get #v_preset_biome3_p_scl2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 store result score #v_ta_perlin_amt1 pl_sys run scoreboard players get #v_preset_biome0_p_amt1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 1 store result score #v_ta_perlin_amt1 pl_sys run scoreboard players get #v_preset_biome1_p_amt1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 2 store result score #v_ta_perlin_amt1 pl_sys run scoreboard players get #v_preset_biome2_p_amt1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 3 store result score #v_ta_perlin_amt1 pl_sys run scoreboard players get #v_preset_biome3_p_amt1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 store result score #v_ta_perlin_amt2 pl_sys run scoreboard players get #v_preset_biome0_p_amt2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 1 store result score #v_ta_perlin_amt2 pl_sys run scoreboard players get #v_preset_biome1_p_amt2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 2 store result score #v_ta_perlin_amt2 pl_sys run scoreboard players get #v_preset_biome2_p_amt2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 3 store result score #v_ta_perlin_amt2 pl_sys run scoreboard players get #v_preset_biome3_p_amt2 pl_sys
#tellraw @a ["biome id: ", {"score":{"name":"#v_ta_biome_id","objective":"pl_sys"}}]
#tellraw @a ["biome h original: ", {"score":{"name":"#v_ta_biome_h","objective":"pl_sys"}}]



# 计算perlin Calculate perlin noise
execute store result score #v_1 pl_sys run scoreboard players get #v_ta_i1 pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_ta_i2 pl_sys
scoreboard players operation #v_1 pl_sys *= #v_ta_perlin_scl1 pl_sys
scoreboard players operation #v_2 pl_sys *= #v_ta_perlin_scl1 pl_sys
function perlin:noise
execute store result score #v_ta_perlin1 pl_sys run scoreboard players get #v_1 pl_sys
#tellraw @a ["perlin n1: ", {"score":{"name":"#v_ta_perlin1","objective":"pl_sys"}}]
scoreboard players operation #v_ta_perlin1 pl_sys *= #n255 pl_sys
scoreboard players operation #v_ta_perlin1 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ta_perlin1 pl_sys -= #v_preset_perlin_n_avg pl_sys
scoreboard players operation #v_ta_perlin1 pl_sys *= #v_ta_perlin_amt1 pl_sys
scoreboard players operation #v_ta_perlin1 pl_sys /= #v_preset_perlin_n_amt pl_sys
#tellraw @a ["perlin n1t: ", {"score":{"name":"#v_ta_perlin1","objective":"pl_sys"}}]
# 计算perlin2 Calculate perlin noise
execute store result score #v_1 pl_sys run scoreboard players get #v_ta_i1 pl_sys
execute store result score #v_2 pl_sys run scoreboard players get #v_ta_i2 pl_sys
scoreboard players operation #v_1 pl_sys *= #v_ta_perlin_scl2 pl_sys
scoreboard players operation #v_2 pl_sys *= #v_ta_perlin_scl2 pl_sys
function perlin:noise
execute store result score #v_ta_perlin2 pl_sys run scoreboard players get #v_1 pl_sys
#tellraw @a ["perlin n2: ", {"score":{"name":"#v_ta_perlin2","objective":"pl_sys"}}]
scoreboard players operation #v_ta_perlin2 pl_sys *= #n255 pl_sys
scoreboard players operation #v_ta_perlin2 pl_sys /= #n10000 pl_sys
scoreboard players operation #v_ta_perlin2 pl_sys -= #v_preset_perlin_n_avg pl_sys
scoreboard players operation #v_ta_perlin2 pl_sys *= #v_ta_perlin_amt2 pl_sys
scoreboard players operation #v_ta_perlin2 pl_sys /= #v_preset_perlin_n_amt pl_sys
#tellraw @a ["perlin n2t: ", {"score":{"name":"#v_ta_perlin2","objective":"pl_sys"}}]
# 求和 Add two perlin noise value
scoreboard players operation #v_ta_perlin1 pl_sys += #v_ta_perlin2 pl_sys


# 平滑群系边界和河流 Smooth the edge of rivers and biomes
# 500< distance <1500
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players operation #v_1 pl_sys = #v_ta_worley2 pl_sys
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players set #v_2 pl_sys 500
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players set #v_3 pl_sys 1500
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players operation #v_4 pl_sys = #v_preset_river_h pl_sys
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players operation #v_5 pl_sys = #v_ta_biome_h pl_sys
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run function perlin:fade2
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players operation #v_ta_biome_h pl_sys = #v_1 pl_sys
# distance <500
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run scoreboard players operation #v_1 pl_sys = #v_ta_worley2 pl_sys
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run scoreboard players set #v_2 pl_sys 0
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run scoreboard players set #v_3 pl_sys 500
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run scoreboard players operation #v_4 pl_sys = #v_preset_river_hmd pl_sys
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run scoreboard players operation #v_5 pl_sys = #v_preset_river_h pl_sys
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run function perlin:fade
execute unless score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..499 run scoreboard players operation #v_ta_biome_h pl_sys = #v_1 pl_sys

# 计算群系和perlin高度系数 Calculate height factor
scoreboard players set #v_ta_factor pl_sys 0
execute if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players operation #v_1 pl_sys = #v_ta_worley2 pl_sys
execute if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players set #v_2 pl_sys 500
execute if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players set #v_3 pl_sys 1500
execute if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players set #v_4 pl_sys 0
execute if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players set #v_5 pl_sys 1000
execute if score #v_ta_worley2 pl_sys matches 500..1500 run function perlin:fade2
execute if score #v_ta_worley2 pl_sys matches 500..1500 run scoreboard players operation #v_ta_factor pl_sys = #v_1 pl_sys
execute if score #v_ta_worley2 pl_sys matches 1501.. run scoreboard players set #v_ta_factor pl_sys 1000

# 如果是大海重新计算 Re-calculate the height and factor if the biome is ocean
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players operation #v_1 pl_sys = #v_ta_worley2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players set #v_2 pl_sys 0
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players set #v_3 pl_sys 1500
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players operation #v_4 pl_sys = #v_preset_river_hmd pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players operation #v_5 pl_sys = #v_ta_biome_h pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run function perlin:fade2
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players operation #v_ta_biome_h pl_sys = #v_1 pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players operation #v_1 pl_sys = #v_ta_worley2 pl_sys
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players set #v_2 pl_sys 0
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players set #v_3 pl_sys 1500
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players set #v_4 pl_sys 0
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players set #v_5 pl_sys 1000
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run function perlin:fade2
execute if score #v_ta_biome_id pl_sys matches 0 if score #v_ta_worley2 pl_sys matches 0..1500 run scoreboard players operation #v_ta_factor pl_sys = #v_1 pl_sys

#tellraw @a ["biome h: ", {"score":{"name":"#v_ta_biome_h","objective":"pl_sys"}}]
#tellraw @a ["factor: ", {"score":{"name":"#v_ta_factor","objective":"pl_sys"}}]



# 合并 Combine
scoreboard players operation #v_ta_perlin1 pl_sys *= #v_ta_factor pl_sys
scoreboard players operation #v_ta_perlin1 pl_sys /= #n1000 pl_sys
scoreboard players operation #v_ta_biome_h pl_sys += #v_ta_perlin1 pl_sys
# 确认生物群系 Confirm biome
scoreboard players operation #v_1 pl_sys = #v_ta_biome_h pl_sys
scoreboard players operation #v_2 pl_sys = #v_ta_biome_id pl_sys
execute if score #v_ta_worley2 pl_sys matches 0..499 unless score #v_ta_biome_id pl_sys matches 0 run scoreboard players set #v_2 pl_sys 999
#tellraw @a ["final: ", {"score":{"name":"#v_1","objective":"pl_sys"}}]
