<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectName/ -->

# ObjectName

 

Returns the Name of a Nn Object.

 

```lua
name = ObjectName(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **name**
  
  - ` string ` : The name of the Object (default "Unknown")

 



 

## Details

 

Some objects may return "Unknown" as the game engine hasn't mapped its GUID to a name.
