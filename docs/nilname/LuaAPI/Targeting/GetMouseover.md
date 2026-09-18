<!-- Source: https://docs.nilname.com/LuaAPI/Targeting/GetMouseover/ -->

# GetMouseover

 

Returns the ` "mouseover" ` as a Nn Object.

 

```lua
mouseover = GetMouseover()
```

 



 

## Returns

 

- **mouseover**
  
  - ` number ` : The Nn Object identifier

 



 

## Details

 

This is often used bridge game data with Nn API. For example ` ObjectFlags(object) ` can be used to obtain the Flags of a GameObject after getting the ` object ` from calling ` GetMouseover() ` while hovering the mouse over e.g. a Copper Vein.
