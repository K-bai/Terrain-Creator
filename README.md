# Terrain Creator
![gen](https://i.loli.net/2020/03/24/nheu9VHky67rJPp.gif)
![view1](https://i.loli.net/2020/03/24/WeGmDkJcl5N13wp.png)
![view2](https://i.loli.net/2020/03/24/Iba5BmVO3jcPdfs.png)
![view3](https://i.loli.net/2020/03/24/UZhqP8C4sbyD97x.png)

# Intro
Terrain creator datapack can create a custom terrain block by block. It calculates perlin and worley noise based on the coordinate of a block. Combine the two noise and add some postprocessing steps to create a full world with different biomes like river, ocean and plain. 

# How to use
Add a tag `map_generator` to a entity(or a player), this datapack will start generate terrain around the entity. It will create 20 blocks per tick and cost about 1400 commands per block. Be careful the light update might be very laggy.

You can also change some parameters in `perlin:preset` to alter some performance, like basic height of every biome.

# How it works
## Pseudo-random number generator
See `perlin:random/number`. This generator used [linear congruential generator](https://en.m.wikipedia.org/wiki/Linear_congruential_generator) and make some changes to fit the integer range in minecraft scoreboard. So it can only generate random numbers ranged from 0 to 8192.

Actually, I was going to use some built-in in minecraft like loot table to generate random number. But the loot table seed can't affect the loot through `/loot` command([MC-174435](https://bugs.mojang.com/browse/MC-174435)).

## Calculate hash code to combine a coordinate and seed.
See `perlin:random/xy`. There are many method to get a hash code from three numbers. Minecraft itself used multiplication with a prime and exclusive or to get the hash code. However it will cost a lot on exclusive or calculation. So I only use multiplication to reach the requirement. 

## Perlin noise
An implement of general 2D perlin noise algorithm in minecraft. The only different with other perlin noise is when choosing a random vector, it will choosing a vector from a pre-defined vector list. See `perlin:init` and `perlin:noise`. 
![perlin](https://i.loli.net/2020/03/24/Gk6OcrWRvyKIDjp.png)

## Worley noise
An implement of general 2D worley noise algorithm in minecraft, and used a simple method to determine where the boarder locate. See `perlin:noise_wm` and [here](http://www.iquilezles.org/www/articles/voronoilines/voronoilines.htm).
![worley](https://i.loli.net/2020/03/24/vMsNt4LwlHEgrhB.png)

## Wave filter
The boarder of worley noise is straight which is really boring. So I add a wave filter on it to make some wave effect. See `perlin:wave`.

## Combine the noise and filter together
Determine biomes with worley noise, and make the boarder as rivier. Smooth the edge with fade function(`perlin:fade`). Finally overlap perlin noise with different parameters on each biome. Input a coordinate, than `perlin:terrain` will ouptut the height and the biome of the block.

## Create terrain chunk by chunk
Summon a pointer each chunk, set different blocks base on different biomes. See `perlin:new_map/`.


# 地形创造
![gen](https://i.loli.net/2020/03/24/nheu9VHky67rJPp.gif)

# 介绍
地形创造数据包可以按方块创造一个自定义的地形。它根据每个方块的坐标来计算Perlin噪声和Worley噪声。将这两种结合，并加上一些后处理步骤，就可以创造一个包含不同生物群系（包括河流、平原、平顶山等）的完整的世界。

# 如何使用
给一个实体或玩家添加一个`map_generator`的tag，就会自动在这个实体周围开始生成地形。它每tick生成20个方块，每个方块消耗1400条命令。光照更新可能带来很大的卡顿。

同样你可以在`perlin:preset`中修改一些参数，比如每个生物群系的基础高度，来生成你自定义的地形。

# 它是如何工作的
## 伪随机数生成器
参见`perlin:random/number`。这个数据包使用了[线性同余生成器](https://en.m.wikipedia.org/wiki/Linear_congruential_generator)来生成随机数。数据包内为了使数据不超过int最大数据的限制进行了一些修改，因此该生成器只能生成0-8192之间的数字。

实际上，我一开始准备用游戏内的伪随机数生成器。但是由于bug[MC-174435](https://bugs.mojang.com/browse/MC-174435)的存在导致loot table seed对`/loot`命令无效，就此作罢。

## 计算哈希码
参见`perlin:random/xy`。由三个数字计算哈希码有很多方法。Minecraft使用了乘并异或的方法。但在游戏内计算异或将消耗大量命令，因此这里使用了乘法来计算。

## Perlin噪声
2D Perlin噪声的游戏内实现。和标准的算法不同的是，本算法只在12个随机向量中选择。参见`perlin:init`和`perlin:noise`。
![perlin](https://i.loli.net/2020/03/24/Gk6OcrWRvyKIDjp.png)

## Worley噪声
2D Worley噪声的游戏内实现。用了一个简单的办法查找不同块之间的边界。参见`perlin:noise_wm`和[这里](http://www.iquilezles.org/www/articles/voronoilines/voronoilines.htm)。
![worley](https://i.loli.net/2020/03/24/vMsNt4LwlHEgrhB.png)

## 波浪滤镜
Worley噪声生成的边界为直线，属实没劲。因此添加了一个波浪滤镜让它看起来更加的浪。参见`perlin:wave`。

## 将噪声和滤镜结合
使用Worley噪声确定生物群系，再让边界成为河流。使用平滑函数使边界更加平滑（`perlin:fade`）。最后把Perlin噪声叠加在上方。最终结果是，给`perlin:terrain`输入一个坐标，它就会返回一个高度和所对应的的生物群系。

## 按区块生成地形
每个区块生成一个游标，根据游标位置调用函数生成区块。参见`perlin:new_map/`。