<!-- Source: https://docs.nilname.com/LuaAPI/Targeting/CastTarget/ -->

# CastTarget

 

Returns the **casting** target of a NPC/Player.

 

```lua
target = CastTarget(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object for the NPC/Player

 



 

## Returns

 

- **target**
  
  - ` number ` : The Object being targeted by the ` object `'s cast

 



 

## Details

 

Please note that [` CastTarget `](https://docs.nilname.com/LuaAPI/Targeting/CastTarget/) is the receiver of the current spell being casted. This doesn't mean it is always the current target of the player/npc as one may change target while a cast is casting.
