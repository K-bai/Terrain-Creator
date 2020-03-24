summon area_effect_cloud ~.0 ~.0 ~.0 {Duration:99999,Tags:["map_mark","map_pointer","map_pointer_new"]}
# 设置坐标 Set coordinate
scoreboard players set @e[tag=map_pointer_new,limit=1] pl_pointer_x 0
scoreboard players set @e[tag=map_pointer_new,limit=1] pl_pointer_z 0

tag @e[tag=map_pointer_new,limit=1] remove map_pointer_new

scoreboard players set @s pl_chunk_stat 2
