<!-- Source: https://docs.nilname.com/LuaAPI/Movement/ScreenToWorld/ -->

# GetFocus

 

Returns a 2D screen point to 3D world coordinates.

 

```lua
x, y, z = ScreenToWorld(x, y, flags)
```

 



 

## Arguments

 

- **x**
  
  - ` number ` : X Screen coord *(pixel value)* 
- **y**
  
  - ` number ` : Y Screen coord *(pixel value)* 
- **flags**
  
  - ` number ` : Hit flags to filter collisions

 



 

## Returns

 

- **x**
  
  - ` number ` : The X-axis world coord 
- **y**
  
  - ` number ` : The Y-axis world coord 
- **z**
  
  - ` number ` : The Z-axis world coord

 



 

## Details

 

This uses [` TraceLine `](https://docs.nilname.com/LuaAPI/Movement/TraceLine/) internally to figure out the depth of when something should be hit. Therefore you should also check out the ` flags ` from the [` TraceLine `](https://docs.nilname.com/LuaAPI/Movement/TraceLine/) API.

 

The X/Y screen coordinates are in pixel values, they range from ` 0 ` to whatever ` GetPhysicalScreenSize() ` returns.
