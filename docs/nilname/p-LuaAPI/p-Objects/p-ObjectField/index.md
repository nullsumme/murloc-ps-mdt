<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectField/ -->

# ObjectField

 

Advanced function to read raw memory from a Nn object. You should only use this if no other Nn function provides what you need!

 

⚠️ Hardcoded offsets may crash game after a update.

 

```lua
data = ObjectField(object, offset, type)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier 
- **offset**
  
  - ` number ` : Memory offset relative to the Nn Object 
- **type**
  
  - ` number ` : The data type for casting

 



 

## Returns

 

- **data**
  
  - ` number ` : Returns data casted into the specified type

 



 

## Details

 

⚠️ Please note that this function **may crash the game** if not used correctly. The memory offsets you hardcode may change in between game versions!

 

The different types can be found here:

 

```text
1 - BYTE (1 byte)
2 - WORD (2 bytes)
3 - DWORD (4 bytes)
4 - float (decimal number)
5 - object id (number)
```
