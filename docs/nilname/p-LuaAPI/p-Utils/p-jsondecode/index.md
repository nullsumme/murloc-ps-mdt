<!-- Source: https://docs.nilname.com/LuaAPI/Utils/jsondecode/ -->

# json.decode

 

**Deserializes** a json string to a Lua table

 

Import from ` Nn.Utils.JSON `

 

```lua
table = json.decode(jsonstr)
```

 



 

## Arguments

 

- **jsonstr**
  
  - ` number ` : serialized JSON data

 



 

## Returns

 

- **object**
  
  - ` table ` : Lua table

 



 

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
