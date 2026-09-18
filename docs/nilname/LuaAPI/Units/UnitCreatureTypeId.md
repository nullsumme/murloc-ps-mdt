<!-- Source: https://docs.nilname.com/LuaAPI/Units/UnitCreatureTypeId/ -->

# UnitCreatureTypeId

 

Returns the "CreatureTypeId" for a given Unit.

 

```lua
creatureId = UnitCreatureTypeId(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **creatureId**
  
  - ` number ` : True if post-lootable loot is available

 



 

## Details

 

The number represents one of the following types

 

```text
* Beast
* Dragonkin
* Demon
* Elemental
* Giant
* Undead
* Humanoid
* Critter
* Mechanical
* Not specified
* Totem
* Non-combat Pet
* Gas Cloud
```
