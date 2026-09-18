<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectAnimationFlag/ -->

# ObjectAnimationFlag

 

Returns the animation flag from a Nn Object.

 

```lua
flag = ObjectAnimationFlag(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **flag**
  
  - ` number ` : The flag

 



 

## Details

 

This is often used for fishing bobbers to see if the bobber animation is set, indicating when to call ` ObjectInteract `.
