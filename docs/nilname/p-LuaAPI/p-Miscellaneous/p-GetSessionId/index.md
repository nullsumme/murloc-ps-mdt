<!-- Source: https://docs.nilname.com/LuaAPI/Miscellaneous/GetSessionId/ -->

# GetSessionId

 

Returns a unique identifier for the current Nn session.

 

```lua
sessionId = GetSessionId()
```

 



 

## Returns

 

- **sessionId**
  
  - ` number ` : unique Nn session Id.

 



 

## Details

 

This number is different between clients and will change when Nn/Game is restarted. This number does NOT change between game login/logouts.
