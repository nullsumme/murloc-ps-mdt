<!-- Source: https://docs.nilname.com/LuaAPI/Targeting/SetMouseover/ -->

# SetMouseover

 

Overwrites the ` "mouseover" ` with a Nn Object.

 

```lua
SetMouseover(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : a Nn Object identifier.

 



 

## Details

 

This is often used bridge Nn Objects with game APIs. For example ` UnitHealth("mouseover") ` can be used to obtain the HP of a Nn Object after setting the Nn Object into ` "mouseover" `.
