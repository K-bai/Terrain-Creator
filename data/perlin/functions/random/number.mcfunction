# 函数参数：#v_1
# 表示作为随机的种子，范围在0~8192之间
# 函数返回值：#v_1
# 表示返回的随机数
# 返回值的范围在0~8192之间

# params: #v_1
# v_1: random seed (0-8192)
# return values: #v_1
# v_1: random value (0-8192)

scoreboard players operation #v_1 pl_sys *= #n214013 pl_sys
scoreboard players operation #v_1 pl_sys += #n2531011 pl_sys
scoreboard players operation #v_1 pl_sys /= #n65536 pl_sys
scoreboard players operation #v_1 pl_sys %= #n8192 pl_sys