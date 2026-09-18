<!-- Source: https://docs.nilname.com/LuaAPI/Movement/GeneratePath/ -->

# GeneratePath

 

Request a path table without using local MMAP files. This requires a callback in order to process the remote request for the pathing server.

 

```lua
GeneratePath(map,x1,y1,z1,x2,y2,z2, callback, smooth, errorCallback)
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
- **callback**
  
  - ` function ` : callback when request is finished 
- **smooth**
  
  - ` boolean ` : u like it rough nah? 
- **errorCallback**
  
  - ` function ` : callback for when the request failed

 



 



 

## Details

 

Doing long distances will give less accurate pathing as the path is smoothened a bit. This rounding can accumulate on big paths and we therefore recommend performing intermediate pathing while navigating to a far away location.

 

```lua
local x,y,z = ObjectPostion('target')
local px,py,pz = ObjectPosition('player')
local map = select(8, GetInstanceInfo())

navCallBack = function(path)
    print('points on the received path', #path)
    DevTools_Dump(path[1]) -- output is {x = 1, y = 2, z = 3}
    DevTools_Dump(path[#path - 1])
end

GeneratePath(map, px,py,pz,x,y,z,navCallBack)
```
