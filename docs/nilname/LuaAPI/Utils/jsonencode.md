<!-- Source: https://docs.nilname.com/LuaAPI/Utils/jsonencode/ -->

# json.encode

 

**Serializes** a Lua table to a json string

 

Import from ` Nn.Utils.JSON `

 

```lua
jsonstr = json.encode(table)
```

 



 

## Arguments

 

- **object**
  
  - ` table ` : Lua table

 



 

## Returns

 

- **jsonstr**
  
  - ` number ` : serialized JSON data

 



 

## Details

 

```lua
local json = Nn.Utils.JSON

local data = {user = "user", pass = "pass"}

local encoded = json.encode(data)
local decoded = json.decode(encoded)

print(encoded)
DevTools_Dump(decoded)
DevTools_Dump(data)
```
