<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectRawPosition/ -->

# ObjectRawPosition

 

Returns the 3D position relative to the current mover.

 

```lua
x, y, z = ObjectRawPosition(object)
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

 

This function is often used to navigate on a moving transport, as the XYZ coordinates are static, making it easier to navigate within a transport object.
