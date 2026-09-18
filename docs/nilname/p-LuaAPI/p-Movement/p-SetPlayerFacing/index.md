<!-- Source: https://docs.nilname.com/LuaAPI/Movement/SetPlayerFacing/ -->

# SetPlayerFacing

 

Updates the facing of the local player.

 

```lua
SetPlayerFacing(facing)
```

 



 

## Arguments

 

- **facing**
  
  - ` number ` : Facing in radians

 



 

## Details

 

You may need to call [` SendMovementHeartbeat `](https://docs.nilname.com/LuaAPI/Movement/SendMovementHeartbeat/) to force set facing server-side.
