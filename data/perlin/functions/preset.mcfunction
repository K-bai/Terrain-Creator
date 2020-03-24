# biome height
## total biome number
scoreboard players set #v_preset_biome_n pl_sys 4
## Ocean
scoreboard players set #v_preset_biome0_h pl_sys 10
## Plain
scoreboard players set #v_preset_biome1_h pl_sys 40
## Mountain
scoreboard players set #v_preset_biome2_h pl_sys 60
## Hill
scoreboard players set #v_preset_biome3_h pl_sys 40

# river height
## river bank height
scoreboard players set #v_preset_river_h pl_sys 30
## river depth
scoreboard players set #v_preset_river_d pl_sys 7


# perlin noise parameter
## some constant
scoreboard players set #v_preset_perlin_n_amt pl_sys 81
scoreboard players set #v_preset_perlin_n_avg pl_sys 126
## amplitude and scale
### Ocean
scoreboard players set #v_preset_biome0_p_amt1 pl_sys 4
scoreboard players set #v_preset_biome0_p_amt2 pl_sys 2
scoreboard players set #v_preset_biome0_p_scl1 pl_sys 200
scoreboard players set #v_preset_biome0_p_scl2 pl_sys 400
### Plain
scoreboard players set #v_preset_biome1_p_amt1 pl_sys 9
scoreboard players set #v_preset_biome1_p_amt2 pl_sys 3
scoreboard players set #v_preset_biome1_p_scl1 pl_sys 200
scoreboard players set #v_preset_biome1_p_scl2 pl_sys 600
### Mountain
scoreboard players set #v_preset_biome2_p_amt1 pl_sys 15
scoreboard players set #v_preset_biome2_p_amt2 pl_sys 5
scoreboard players set #v_preset_biome2_p_scl1 pl_sys 150
scoreboard players set #v_preset_biome2_p_scl2 pl_sys 450
### Hill
scoreboard players set #v_preset_biome3_p_amt1 pl_sys 10
scoreboard players set #v_preset_biome3_p_amt2 pl_sys 5
scoreboard players set #v_preset_biome3_p_scl1 pl_sys 200
scoreboard players set #v_preset_biome3_p_scl2 pl_sys 400

# worley noise parameter
scoreboard players set #v_preset_worley_f pl_sys 50


# some pre-calculation
## river bottom height
scoreboard players set #v_preset_river_hmd pl_sys 0
scoreboard players operation #v_preset_river_hmd pl_sys = #v_preset_river_h pl_sys
scoreboard players operation #v_preset_river_hmd pl_sys -= #v_preset_river_d pl_sys