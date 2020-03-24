scoreboard players set #v_1 pl_sys -40
scoreboard players set #v_2 pl_sys -34
function perlin:terrain
tellraw @a ["n1: ", {"score":{"name":"#v_1","objective":"pl_sys"}}]
tellraw @a ["n2: ", {"score":{"name":"#v_2","objective":"pl_sys"}}]

#scoreboard players set #v_1 pl_sys 1300
#scoreboard players set #v_2 pl_sys 0
#scoreboard players set #v_3 pl_sys 1500
#scoreboard players set #v_4 pl_sys 23
#scoreboard players set #v_5 pl_sys 10
#function perlin:fade2
#tellraw @a ["n1: ", {"score":{"name":"#v_1","objective":"pl_sys"}}]
#tellraw @a ["n2: ", {"score":{"name":"#v_2","objective":"pl_sys"}}]
