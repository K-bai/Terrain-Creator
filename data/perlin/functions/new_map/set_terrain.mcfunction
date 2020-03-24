# 保存当前坐标 Save current coordinate
execute store result score #v_1 pl_sys run data get entity @s Pos[0] 1
execute store result score #v_2 pl_sys run data get entity @s Pos[2] 1

# 计算噪声 Noise
function perlin:terrain

execute store result entity @s Pos[1] double 1 run scoreboard players get #v_1 pl_sys

# 根据群系设置方块 Set block according to biome
execute at @s run setblock ~ 5 ~ bedrock
execute if score #v_2 pl_sys matches 0 at @s run fill ~ 30 ~ ~ ~ ~ water
execute if score #v_2 pl_sys matches 0 at @s run fill ~ ~ ~ ~ 6 ~ gravel

execute if score #v_2 pl_sys matches 1 at @s run setblock ~ ~ ~ grass_block
execute if score #v_2 pl_sys matches 1 at @s run fill ~ ~-1 ~ ~ ~-2 ~ dirt
execute if score #v_2 pl_sys matches 1 at @s run fill ~ ~-3 ~ ~ 6 ~ stone

execute if score #v_2 pl_sys matches 2 at @s run fill ~ ~ ~ ~ ~-2 ~ orange_terracotta
execute if score #v_2 pl_sys matches 2 at @s run fill ~ ~-3 ~ ~ ~-10 ~ yellow_terracotta
execute if score #v_2 pl_sys matches 2 at @s run fill ~ ~-11 ~ ~ 6 ~ white_terracotta

execute if score #v_2 pl_sys matches 3 at @s run setblock ~ ~ ~ podzol
execute if score #v_2 pl_sys matches 3 at @s run fill ~ ~-1 ~ ~ ~-2 ~ dirt
execute if score #v_2 pl_sys matches 3 at @s run fill ~ ~-3 ~ ~ 6 ~ stone

execute if score #v_2 pl_sys matches 999 at @s run fill ~ 30 ~ ~ ~ ~ water
execute if score #v_2 pl_sys matches 999 at @s run fill ~ ~ ~ ~ 6 ~ dirt