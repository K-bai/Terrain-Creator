# 函数参数：#v_1, #v_2, #v_3, #v_4, #v_5
# #v_1: 表示插值点
# #v_2-3: 插值起点和终点
# #v_4-5: 插值结果最小值最大值
# 函数返回值：#v_1
# #v_1: 插值结果

# n = (x-start)*1000/(end-start)
execute store result score #v_fd_n pl_sys run scoreboard players get #v_1 pl_sys
scoreboard players operation #v_fd_n pl_sys -= #v_2 pl_sys
execute store result score #v_fd_t0 pl_sys run scoreboard players get #v_3 pl_sys
scoreboard players operation #v_fd_t0 pl_sys -= #v_2 pl_sys
scoreboard players operation #v_fd_n pl_sys *= #n1000 pl_sys
scoreboard players operation #v_fd_n pl_sys /= #v_fd_t0 pl_sys

# r = -n*n/1000+2*n
execute store result score #v_1 pl_sys run scoreboard players get #v_fd_n pl_sys
scoreboard players operation #v_1 pl_sys *= #v_fd_n pl_sys
scoreboard players operation #v_1 pl_sys *= #nm1 pl_sys
scoreboard players operation #v_1 pl_sys /= #n1000 pl_sys
execute store result score #v_fd_t0 pl_sys run scoreboard players get #v_fd_n pl_sys
scoreboard players operation #v_fd_t0 pl_sys *= #n2 pl_sys
scoreboard players operation #v_1 pl_sys += #v_fd_t0 pl_sys

# r = r*(max-min)/1000+min
execute store result score #v_fd_t0 pl_sys run scoreboard players get #v_5 pl_sys
scoreboard players operation #v_fd_t0 pl_sys -= #v_4 pl_sys
scoreboard players operation #v_1 pl_sys *= #v_fd_t0 pl_sys
scoreboard players operation #v_1 pl_sys /= #n1000 pl_sys
scoreboard players operation #v_1 pl_sys += #v_4 pl_sys

