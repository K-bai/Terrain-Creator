execute align xyz run summon area_effect_cloud ~.0 0 ~.0 {Duration:99999,Tags:["map_mark","map_chunk","map_chunk_new"]}
execute store result score #v_1 pl_sys run data get entity @s Pos[0] 0.0625
execute store result score #v_2 pl_sys run data get entity @s Pos[2] 0.0625
execute store result entity @e[tag=map_chunk_new,limit=1] Pos[0] double 16 run scoreboard players get #v_1 pl_sys
execute store result entity @e[tag=map_chunk_new,limit=1] Pos[2] double 16 run scoreboard players get #v_2 pl_sys
scoreboard players set @e[tag=map_chunk_new,limit=1] pl_chunk_stat 0
tag @e[tag=map_chunk_new,limit=1] remove map_chunk_new