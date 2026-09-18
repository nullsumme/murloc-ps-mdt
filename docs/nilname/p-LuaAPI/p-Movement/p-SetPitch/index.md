<!-- Source: https://docs.nilname.com/LuaAPI/Movement/SetPitch/ -->

# SetPitch

 

Update the pitch of the local player.

 

```lua
SetPitch(object, pitch)
```

 



 

## Arguments

 

- **object**
  
   
  
  - ` number ` : local player Nn Object 
- **pitch**
  
   
  
  - ` number ` : Pitch in radians

 



 

## Details

 

You may need to call [` SendMovementHeartbeat `](https://docs.nilname.com/LuaAPI/Movement/SendMovementHeartbeat/) to force set pitch server-side.

 

This only works for the local player.
