<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectExists/ -->

# ObjectExists

 

Returns true if the Nn Object identifier is loaded in the object manager

 

```lua
exists = ObjectExists(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **exists**
  
  - ` boolean ` : True if object is located inside the game engine

 



 

## Details

 

Some Lua APIs may need a confirmation before you pass in any cached Nn Object identifiers.
