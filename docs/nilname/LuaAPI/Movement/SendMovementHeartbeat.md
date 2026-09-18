<!-- Source: https://docs.nilname.com/LuaAPI/Movement/SendMovementHeartbeat/ -->

# SendMovementHeartbeat

 

Sends a movement heartbeat update.

 

```lua
SendMovementHeartbeat()
```

 



 

## Details

 

This may be used to sync your client with the server.

 

For example, when calling [` SetPlayerFacing `](https://docs.nilname.com/LuaAPI/Movement/SetPlayerFacing/) it is only updated client-side, and will only be 'truely' updated when calling [` SendMovementHeartbeat `](https://docs.nilname.com/LuaAPI/Movement/SendMovementHeartbeat/#).

 

Without updating server-side, you may have issues casting Blink or facing NPCs.
