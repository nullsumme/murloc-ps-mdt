<!-- Source: https://docs.nilname.com/LuaAPI/Targeting/UnitTarget/ -->

# UnitTarget

 

Returns the target of a NPC/Player.

 

```lua
target = UnitTarget(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object for the NPC/Player

 



 

## Returns

 

- **target**
  
  - ` number ` : The Object being targeted by the ` object `

 



 

## Details

 

Please note that [` UnitTarget `](https://docs.nilname.com/LuaAPI/Targeting/UnitTarget/) doesn't always equal the [` CastTarget `](https://docs.nilname.com/LuaAPI/Targeting/CastTarget/) as a player may changes target while a cast is still pending.
