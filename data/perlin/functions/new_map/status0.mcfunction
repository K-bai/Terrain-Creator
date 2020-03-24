# 计算周围区块数量 Neighbor chunk number
execute store result score #v_1 pl_sys if entity @e[tag=map_chunk,distance=..24]
# 若不足9且距玩家近，尝试生成新区块 Less than 9, than summon new chunks
execute if score #v_1 pl_sys matches ..8 at @e[tag=map_generator] positioned ~ 1 ~ as @s[distance=..100] at @s run function perlin:new_map/new_chunks
# 计算周围状态0以上区块数量 Neighbor chunk number
execute store result score #v_1 pl_sys if entity @e[tag=map_chunk,scores={pl_chunk_stat=0..},distance=..24]
# 若等于9则进入2 Enter 2
execute if score #v_1 pl_sys matches 9 run scoreboard players set @s pl_chunk_stat 1
