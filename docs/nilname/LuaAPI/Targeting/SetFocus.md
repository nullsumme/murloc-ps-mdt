<!-- Source: https://docs.nilname.com/LuaAPI/Targeting/SetFocus/ -->

# SetFocus

 

Overwrites the ` "focus" ` with a Nn Object.

 

```lua
SetFocus(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : a Nn Object identifier.

 



 

## Details

 

This is often used bridge Nn Objects with game APIs. For example ` UnitName("focus") ` can be used to obtain the name of a Nn Object after setting the Nn Object into ` "focus" `.
