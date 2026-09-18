<!-- Source: https://docs.nilname.com/LuaAPI/Movement/TraceLine/ -->

# TraceLine

 

Casts a ray in the 3D world scene to find a collision point.

 

```lua
x, y, z = TraceLine(x1, y1, z1, x2, y2, z2, flags)
```

 



 

## Arguments

 

- **x1**
  
  - ` number ` : start X-axis 
- **y1**
  
  - ` number ` : start Y-axis 
- **z1**
  
  - ` number ` : start Z-axis 
- **x2**
  
  - ` number ` : end X-axis 
- **y2**
  
  - ` number ` : end Y-axis 
- **z2**
  
  - ` number ` : end Z-axis 
- **flags**
  
  - ` number ` : flags to indicate collision types

 



 

## Returns

 

- **x**
  
  - ` number|boolean ` : False or X-axis we collided with 
- **y**
  
  - ` number|nil ` : nil or Y-axis we collided with 
- **z**
  
  - ` number|nil ` : nil or Z-axis we collided with

 



 

## Details

 

The game will first perform some AABB tests to figure out what objects are within the range of your given vector. From there it will then test all objects in that range. So using smaller vectors when possible can actually reduce performance impact.

 

The flags you may want to set:

 

```text
M2Collision = 0x1
M2Render = 0x2
WMOCollision = 0x10
WMORender = 0x20
Terrain = 0x100
WaterWalkableLiquid = 0x10000
Liquid = 0x20000
EntityCollision = 0x100000
Unknown = 0x200000
```
