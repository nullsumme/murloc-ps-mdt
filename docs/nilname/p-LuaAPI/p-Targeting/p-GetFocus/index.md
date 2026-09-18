<!-- Source: https://docs.nilname.com/LuaAPI/Targeting/GetFocus/ -->

# GetFocus

 

Returns the ` "focus" ` as a Nn Object.

 

```lua
focus = GetFocus()
```

 



 

## Returns

 

- **focus**
  
  - ` number ` : The Nn Object identifier

 



 

## Details

 

This is often used bridge game data with Nn API. For example ` ObjectHeight(object) ` can be used to obtain the height of a NPC after getting the ` object ` from calling ` GetFocus() `.
