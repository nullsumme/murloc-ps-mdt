<!-- Source: https://docs.nilname.com/LuaAPI/Miscellaneous/SetNavHost/ -->

# SetNavHost

 

For Added benefit you can have NnNav server executing in either outside a VM or in the local Network.

 

You can specify which host to connect to **defaults to ` localhost `**

 

```lua
SetNavHost(hosturl)
```

 



 

## Arguments

 

- **hosturl**
  
  - ` string ` : URL path to your NnNav server

 



 

## Details

 

Currently [` SetNavHost `](https://docs.nilname.com/LuaAPI/Miscellaneous/SetNavHost/#) affects both synchronous [` GenerateLocalPath `](https://docs.nilname.com/LuaAPI/Movement/GeneratePath/) and async [` GeneratePath `](https://docs.nilname.com/LuaAPI/Movement/GeneratePath/) calls but this may change at a later stage

 

```lua
SetNavHost("192.168.1.1") -- assuming you have NnNav and mmaps running on a separate pc in your network
```
