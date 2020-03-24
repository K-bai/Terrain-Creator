# Terrain Creator
# Intro
Terrain creator datapack can create a custom terrain block by block. It calculates perlin and worley noise based on the coordinate of a block. Combine the two noise and add some postprocessing steps to create a full world with different biomes like river, ocean and plain. 

# How to use
Add a tag `map_generator` to a entity(or a player), this datapack will start generate terrain around the entity. It will  create 20 blocks per tick and cost about 1400 commands per block. Be careful the light update might be very laggy.

You can also change some parameters in `perlin:preset` to alter some performance, like basic height of every biome.

# How it works
## Pseudo-random number generator
See `perlin:random/number`. This generator used [linear congruential generator](https://en.m.wikipedia.org/wiki/Linear_congruential_generator) and make some changes to fit the integer range in minecraft scoreboard. So it can only generate random numbers ranged from 0 to 8192.

Actually, I'm going to use some built-in in minecraft like loot table to generate random number. But the loot table seed can't affect the loot through `/loot` command([MC-174435](https://bugs.mojang.com/browse/MC-174435)).

## Calculate hash code to combine a coordinate and seed.
There are many method to get a hash code from three numbers. Minecraft itself used multiplication with a prime and exclusive or to get the hash code. However it will cost a lot on exclusive or calculation. So I only use multiplication to reach the requirement. 

## Perlin noise
An implement of general 2D perlin noise algorithm in minecraft. The only different with other perlin noise is when choosing a random vector, it will choosing a vector from a pre-defined vector list. See `perlin:init` and `perlin:noise`. 

## Worley noise
An implement of general 2D worley noise algorithm in minecraft, and used a simple method to determine where the boarder locate. See `perlin:noise_wm` and [here](http://www.iquilezles.org/www/articles/voronoilines/voronoilines.htm).

## Wave filter
The boarder of worley noise is straight which is really boring. So I add a wave filter on it to make some wave effect. See `perlin:wave`.

## Combine the noise and filter together
Determine biomes with worley noise, and make the boarder as rivier. Smooth the edge with fade function(`perlin:fade`). Finally overlap perlin noise with different parameters on each biome. Input a coordinate, than `perlin:terrain` will ouptut the height and the biome of the block.

## Create terrain chunk by chunk
Summon a pointer each chunk, set different blocks base on different biomes. See `perlin:new_map/`.
