# 游标地形生成 Pointer terrain generate
function perlin:new_map/set_terrain
scoreboard players add @s pl_pointer_x 1
tp @s[scores={pl_pointer_x=16}] ~-15 ~ ~1
tp @s[scores={pl_pointer_x=..15}] ~1 ~ ~
scoreboard players add @s[scores={pl_pointer_x=16}] pl_pointer_z 1
scoreboard players set @s[scores={pl_pointer_x=16}] pl_pointer_x 0

# 地形生成完成将源区块设为状态3 并清除自身
# Set to 3 and kill itself after finish
execute if score @s pl_pointer_z matches 16 run tp @s ~ 0 ~-16
execute if score @s pl_pointer_z matches 16 run scoreboard players set @e[tag=map_chunk,distance=...1] pl_chunk_stat 3
execute if score @s pl_pointer_z matches 16 run kill @s