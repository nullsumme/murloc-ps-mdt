<!-- Source: https://docs.nilname.com/LuaAPI/Movement/GenerateLocalPath/ -->

# GenerateLocalPath

 

Request a path table from the nilname local server. Requires that **you must run NnNav.exe** and have the mmaps folder with the needed map files. No callback is required.

 

```lua
points = GenerateLocalPath(map, x1, y1, z1, x2, y2, z2, errorCallback, smooth)
```

 



 

## Arguments

 

- **map**
  
  - ` number ` : map instanceId *(e.g. ` select(8,GetInstanceInfo()) `)* 
- **x1**
  
  - ` number ` : start X world coord 
- **y1**
  
  - ` number ` : start Y world coord 
- **z1**
  
  - ` number ` : start Z world coord 
- **x2**
  
  - ` number ` : end X world coord 
- **y2**
  
  - ` number ` : end Y world coord 
- **z2**
  
  - ` number ` : end Z world coord 
- **errorCallback**
  
  - ` function ` : callback when request failed 
- **smooth**
  
  - ` boolean ` : u like it rough nah?

 



 

## Details

 

Doing long distances will give less accurate pathing as the path is smoothened a bit. This rounding can accumulate on big paths and we therefore recommend performing intermediate pathing while navigating to a far away location.

 

- ` errorCallback ` will be called if you somehow fail to connect to the server

 

```lua
local map = select(8, GetInstanceInfo())
local px,py,pz = ObjectPosition('player') 
local x,y,z = ObjectPosition('target') 

local path = GenerateLocalPath(map,px,py,pz,x,y,z) -- raw path
local path = GenerateLocalPath(map,px,py,pz,x,y,z,function()
    -- handle error connecting to NnNav Server
end)
local path = GenerateLocalPath(map,px,py,pz,x,y,z,nil,true) -- smoothened path

if not (path[1].x == px and path[1].y == py and path[1].z == pz) then
    local diff = Distance(px,py,pz,path[1].x,path[1].y,path[1].z)
    print(format('returned path start position differs from that of player by %.3f yds',diff))
end
```
