# 函数参数：#v_1, #v_2
# 表示要求的整数坐标 (scale:1)
# 函数返回值：#v_1, #v_2
# 分别表示扭曲后的坐标 (scale:1)

# param: #v_1, #v_2
# v_1-2: integer coordinate (scale:1)
# return values: #v_1, #v_2
# v_1-2: waved integer coordinate (scale:1)

# Wave length and amplitude
scoreboard players set #v_wv_wavelength pl_sys 70
scoreboard players set #v_wv_strength pl_sys 8
execute store result score #v_wv_i1 pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_wv_i2 pl_sys run scoreboard players get #v_2 pl_sys



# strength*wave(y*1000/wave_length)/1000
scoreboard players operation #v_2 pl_sys *= #n1000 pl_sys
scoreboard players operation #v_2 pl_sys /= #v_wv_wavelength pl_sys
## 取小数位 Get demical places
scoreboard players operation #v_2 pl_sys %= #n1000 pl_sys
## wave function
execute store result score #v_wv_r1 pl_sys run scoreboard players get #v_2 pl_sys
execute store result score #v_wv_t1 pl_sys run scoreboard players get #v_2 pl_sys
execute store result score #v_wv_t2 pl_sys run scoreboard players get #v_2 pl_sys
### <500
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_r1 pl_sys *= #nm1 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_r1 pl_sys *= #v_2 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_r1 pl_sys *= #v_2 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_r1 pl_sys /= #n31250 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_t1 pl_sys *= #v_2 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_t1 pl_sys *= #n3 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players operation #v_wv_t1 pl_sys /= #n125 pl_sys
execute if score #v_2 pl_sys matches 0..499 run scoreboard players remove #v_wv_t1 pl_sys 1000
execute if score #v_2 pl_sys matches 0..499 run scoreboard players set #v_wv_t2 pl_sys 0
### >500
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_r1 pl_sys *= #v_2 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_r1 pl_sys *= #v_2 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_r1 pl_sys /= #n31250 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys *= #nm1 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys *= #n9 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys *= #v_2 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys /= #n125 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players operation #v_wv_t2 pl_sys *= #n48 pl_sys
execute if score #v_2 pl_sys matches 500..999 run scoreboard players remove #v_wv_t2 pl_sys 9000
scoreboard players operation #v_wv_r1 pl_sys += #v_wv_t1 pl_sys
scoreboard players operation #v_wv_r1 pl_sys += #v_wv_t2 pl_sys
# strength
scoreboard players operation #v_wv_r1 pl_sys *= #v_wv_strength pl_sys
scoreboard players operation #v_wv_r1 pl_sys /= #n1000 pl_sys



# strength*wave(x*1000/wave_length+500)/1000
scoreboard players operation #v_1 pl_sys *= #n1000 pl_sys
scoreboard players operation #v_1 pl_sys /= #v_wv_wavelength pl_sys
scoreboard players add #v_1 pl_sys 500
## 取小数位 Get demical places
scoreboard players operation #v_1 pl_sys %= #n1000 pl_sys
## wave function
execute store result score #v_wv_r2 pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_wv_t1 pl_sys run scoreboard players get #v_1 pl_sys
execute store result score #v_wv_t2 pl_sys run scoreboard players get #v_1 pl_sys
### <500
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_r2 pl_sys *= #nm1 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_r2 pl_sys *= #v_1 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_r2 pl_sys *= #v_1 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_r2 pl_sys /= #n31250 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_t1 pl_sys *= #v_1 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_t1 pl_sys *= #n3 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players operation #v_wv_t1 pl_sys /= #n125 pl_sys
execute if score #v_1 pl_sys matches 0..499 run scoreboard players remove #v_wv_t1 pl_sys 1000
execute if score #v_1 pl_sys matches 0..499 run scoreboard players set #v_wv_t2 pl_sys 0
### >500
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_r2 pl_sys *= #v_1 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_r2 pl_sys *= #v_1 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_r2 pl_sys /= #n31250 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys *= #nm1 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys *= #n9 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys *= #v_1 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_t1 pl_sys /= #n125 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players operation #v_wv_t2 pl_sys *= #n48 pl_sys
execute if score #v_1 pl_sys matches 500..999 run scoreboard players remove #v_wv_t2 pl_sys 9000
scoreboard players operation #v_wv_r2 pl_sys += #v_wv_t1 pl_sys
scoreboard players operation #v_wv_r2 pl_sys += #v_wv_t2 pl_sys
# strength
scoreboard players operation #v_wv_r2 pl_sys *= #v_wv_strength pl_sys
scoreboard players operation #v_wv_r2 pl_sys /= #n1000 pl_sys



# output
scoreboard players operation #v_1 pl_sys = #v_wv_i1 pl_sys
scoreboard players operation #v_2 pl_sys = #v_wv_i2 pl_sys
scoreboard players operation #v_1 pl_sys += #v_wv_r1 pl_sys
scoreboard players operation #v_2 pl_sys += #v_wv_r2 pl_sys