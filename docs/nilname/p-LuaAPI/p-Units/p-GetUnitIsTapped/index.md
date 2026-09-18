<!-- Source: https://docs.nilname.com/LuaAPI/Units/GetUnitIsTapped/ -->

# GetUnitIsTapped

 

> ⚠️ DEPRECATED: use ` UnitIsTapDenied `

 

Returns whether or not a unit is 'tapped' by another player.

 

```lua
isTapped = GetUnitIsTapped(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **isTapped**
  
  - ` boolean ` : is 'tapped'

 



 

## Details

 

The 'tapped' means if another player has attacked the NPC. It is shown in-game by the health bar color.

 

You may want to avoid 'tapped' NPC's as those won't yield experience or honnor for you.
