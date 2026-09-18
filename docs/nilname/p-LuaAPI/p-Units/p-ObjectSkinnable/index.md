<!-- Source: https://docs.nilname.com/LuaAPI/Units/ObjectSkinnable/ -->

# ObjectSkinnable

 

Returns true if the Unit can be interact with in a "post-lootable" state.

 

```lua
lootable = ObjectSkinnable(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **lootable**
  
  - ` boolean ` : True if post-lootable loot is available

 



 

## Details

 

Units who are dead and have already been looted *(post-lootable state)* may be "looted" again with a proffesion type.

 

For example, dead Units that have been looted *could* be skinned if Beast type, mined if Elemental type, Engineerd of Mechanical type, etc...

 

To check the CreatureType of a Unit (Beast, Humanoid, Elemental, ...) you can use [` UnitCreatureTypeId `](https://docs.nilname.com/LuaAPI/Units/UnitCreatureTypeId/)
