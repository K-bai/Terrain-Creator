summon area_effect_cloud ~.0 ~.0 ~.0 {Duration:99999,Tags:["map_mark","map_chunk","map_chunk_new"]}
scoreboard players set @e[tag=map_chunk_new,limit=1] pl_chunk_stat 0
tag @e[tag=map_chunk_new,limit=1] remove map_chunk_new