# pl_chunk_stat:
# 0: 新生区块，尝试向周围生成新生区块，若周围总区块满9个，则进入1
# 1: 准备生成基础地形。若总地形游标不足10且距玩家最近，则进入2
# 2: 已生成地形游标，正在生成地形。若生成结束，进入3
# 3: 地形生成完毕

# pl_chunk_stat:
# 0: New chunks. Try to create new chunks nearby
# 1: Enough chunks nearby, ready to generate terrain
# 2: Create pointer
# 3: Finish

# 周围没有区块，就新建一个区块，对齐坐标轴
# No chunks, and create new one
execute as @e[tag=map_generator] at @s positioned ~ 0 ~ unless entity @e[tag=map_chunk,distance=..30] run function perlin:new_map/init
# 状态0区块向周围生成新区块，若周围存在9个0以上，进入1
# Create new chunks nearby
execute as @e[tag=map_chunk,scores={pl_chunk_stat=0}] at @s run function perlin:new_map/status0
# 计算地形游标数量
# Pointer number
execute store result score #v_1 pl_sys if entity @e[tag=map_pointer]
# 若地形游标数量不足20，则最近状态1区块生成一个新游标，并进入2
# If pointer number is less than 20, than add a new one
execute if score #v_1 pl_sys matches ..19 at @e[tag=map_generator,sort=random] as @e[tag=map_chunk,scores={pl_chunk_stat=1},limit=1,sort=nearest] at @s run function perlin:new_map/status1




# 游标地形生成 Pointer create terrain
execute as @e[tag=map_pointer] at @s run function perlin:new_map/pointer_tick