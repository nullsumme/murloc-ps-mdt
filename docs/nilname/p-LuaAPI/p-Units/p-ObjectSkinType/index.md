<!-- Source: https://docs.nilname.com/LuaAPI/Units/ObjectSkinType/ -->

# ObjectSkinType

 

> ⚠️ DEPRECATED

 

Returns 3 (skinnabled), 2 (Mineable) or false

 

```lua
type = ObjectSkinType(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **tatyperget**
  
  - ` number|boolean ` : 3 (skinnabled), 2 (Mineable) or false

 



 

## Details

 

This was a old hacky fix to deal with Elementals that are minable. We have learned that [` UnitCreatureTypeId `](https://docs.nilname.com/LuaAPI/Units/UnitCreatureTypeId/) must be used to check if the target is ` Beast ` and to check if [` ObjectSkinnable `](https://docs.nilname.com/LuaAPI/Units/ObjectSkinnable/) after it has been looted.

 

The [` ObjectSkinnable `](https://docs.nilname.com/LuaAPI/Units/ObjectSkinnable/) is more like ` ObjectPostLootable ` as it checks if one can interact with a dead, already-looted object.

 

For example, dead Units that have been looted *could* be skinned if Beast type, mined if Elemental type, Engineerd of Mechanical type, etc...
