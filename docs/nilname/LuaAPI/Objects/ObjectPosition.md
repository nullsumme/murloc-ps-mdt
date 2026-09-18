<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectPosition/ -->

# ObjectPosition

 

Returns the 3D World position of a Nn Object.

 

```lua
x, y, z = ObjectPosition(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **x**
  
  - ` number ` : X-coord in 3D space 
- **y**
  
  - ` number ` : Y-coord in 3D space 
- **z**
  
  - ` number ` : Z-coord in 3D space

 



 

## Details

 

This XYZ is relative to the world, meaning that, if you stand on a transport/mover (e.g. zeppelin), the position of your player is relative to the world and NOT the transport you are standing on.

 

To get coordinates relative to the current object, use [` ObjectRawPosition `](https://docs.nilname.com/LuaAPI/Objects/ObjectRawPosition/) instead.
