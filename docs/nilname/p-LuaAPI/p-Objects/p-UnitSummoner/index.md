<!-- Source: https://docs.nilname.com/LuaAPI/Objects/UnitSummoner/ -->

# UnitSummoner

 

Returns who summoned the NPC

 

```lua
summoner = UnitSummoner(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **summoner**
  
  - ` number ` : Summoner of the given NPC

 



 

## Details

 

Don't confuse this one with ObjectSummoner and UnitSummoner!

 

The (battle) pets are created units, Player pets (e.g. warlock) are also summoned units but GameObject (e.g. toys) are GameObject Created
