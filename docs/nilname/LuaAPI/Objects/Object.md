<!-- Source: https://docs.nilname.com/LuaAPI/Objects/Object/ -->

# Object

 

Takes a lua token and returns a Nn Object identifier in return

 

```lua
object = Object(token)
```

 



 

## Arguments

 

- **token**
  
  - ` string ` : Takes a Lua token

 



 

## Returns

 

- **object**
  
  - ` number ` : The Nn Object identifier

 



 

## Details

 

Lua tokens are things like ` "player" ` or ` "focus" `.

 

Full list of Lua tokens:

 

- ` "target" ` 
- ` "focus" ` 
- ` "player" ` 
- ...

 

More complex combination can be made like so: - ` "target" .. "oftarget" ` - ` "party" .. i ` - ` "party3focus" ` - ...
