<!-- Source: https://docs.nilname.com/Home/LuaAPISummary/ -->

# API Summary

 

These are all the Lua APIs provided by Nn. Some may already exist and are 'unlocked', those are marked with a 🔓 icon.

 

Regardless, all of these APIs are located in the Nn _ENV, which is default set when [loading a Nn script](https://docs.nilname.com/Home/LuaAPISummary/#).

 

NOTE: the terms "Nn Object" and "Object" are used interchangeably and have the same meaning.

 

## 🎯 Targeting and Focus

 

- ClearTarget 🔓 
- FocusUnit 🔓 
- [GetFocus](https://docs.nilname.com/LuaAPI/Targeting/GetFocus/) 
- [GetMouseover](https://docs.nilname.com/LuaAPI/Targeting/GetMouseover/) 
- [GetNPCObject](https://docs.nilname.com/LuaAPI/Targeting/GetNPCObject/) 
- [SetFocus](https://docs.nilname.com/LuaAPI/Targeting/SetFocus/) 
- [SetMouseover](https://docs.nilname.com/LuaAPI/Targeting/SetMouseover/) 
- [SetNPCObject](https://docs.nilname.com/LuaAPI/Targeting/SetNPCObject/) 
- [UnitTarget](https://docs.nilname.com/LuaAPI/Targeting/UnitTarget/) 
- [CastTarget](https://docs.nilname.com/LuaAPI/Targeting/CastTarget/) 
- [PlayerTarget](https://docs.nilname.com/LuaAPI/Targeting/PlayerTarget/) 
- TargetUnit 🔓

 

## 🪨 Object Management

 

Objects and GameObjects are two different things. A "GameObject" is just a type of "Object", the Type of an "Object" is obtained with [` ObjectType `](https://docs.nilname.com/LuaAPI/Objects/ObjectType/).

 

- GetObjects 
- [Object](https://docs.nilname.com/LuaAPI/Objects/Object/) 
- [ObjectFacing](https://docs.nilname.com/LuaAPI/Objects/ObjectFacing/) 
- [ObjectField](https://docs.nilname.com/LuaAPI/Objects/ObjectField/) 
- [ObjectHeight](https://docs.nilname.com/LuaAPI/Objects/ObjectHeight/) 
- [ObjectName](https://docs.nilname.com/LuaAPI/Objects/ObjectName/) 
- [ObjectPosition](https://docs.nilname.com/LuaAPI/Objects/ObjectPosition/) 
- [ObjectType](https://docs.nilname.com/LuaAPI/Objects/ObjectType/) 
- [ObjectAnimationFlag](https://docs.nilname.com/LuaAPI/Objects/ObjectAnimationFlag/) 
- [ObjectBoundingRadius](https://docs.nilname.com/LuaAPI/Objects/ObjectBoundingRadius/) 
- [ObjectExists](https://docs.nilname.com/LuaAPI/Objects/ObjectExists/) 
- [ObjectFlags](https://docs.nilname.com/LuaAPI/Objects/ObjectFlags/) 
- [ObjectId](https://docs.nilname.com/LuaAPI/Objects/ObjectId/) 
- [ObjectUnitId](https://docs.nilname.com/LuaAPI/Objects/ObjectUnitId/) 
- [ObjectInteract](https://docs.nilname.com/LuaAPI/Objects/ObjectInteract/) 
- [ObjectLootable](https://docs.nilname.com/LuaAPI/Objects/ObjectLootable/) 
- [ObjectSkinType](https://docs.nilname.com/LuaAPI/Units/ObjectSkinType/) 
- [ObjectSkinnable](https://docs.nilname.com/LuaAPI/Objects/ObjectSkinnable/) 
- ObjectYaw 
- ObjectRotation 
- [ObjectCreator](https://docs.nilname.com/LuaAPI/Objects/ObjectCreator/) 
- UnitCreator 
- [UnitSummoner](https://docs.nilname.com/LuaAPI/Objects/UnitSummoner/)

 

## 🧍 Unit/Character Info

 

A Unit is often a Player, Local Player *(you)* or NPC. These "Units" are a type of "Object".

 

- [CombatReach](https://docs.nilname.com/LuaAPI/Units/CombatReach/) 
- [DynamicFlags](https://docs.nilname.com/LuaAPI/Units/DynamicFlags/) 
- [GameObjectType](https://docs.nilname.com/LuaAPI/Objects/GameObjectType/) 
- [GetUnitBoundingRadius](https://docs.nilname.com/LuaAPI/Units/GetUnitBoundingRadius/) 
- GetUnitCombatReach 
- [GetUnitCreatedBy](https://docs.nilname.com/LuaAPI/Units/GetUnitCreatedBy/) 
- [GetUnitIsTapped](https://docs.nilname.com/LuaAPI/Units/GetUnitIsTapped/) 
- [GetUnitLootable](https://docs.nilname.com/LuaAPI/Units/GetUnitLootable/) 
- [GetUnitSummonedBy](https://docs.nilname.com/LuaAPI/Units/GetUnitSummonedBy/) 
- GetUnitTarget 
- NPCFlags 
- [ObjectSkinType](https://docs.nilname.com/LuaAPI/Units/ObjectSkinType/) 
- [ObjectSkinnable](https://docs.nilname.com/LuaAPI/Units/ObjectSkinnable/) 
- [UnitCreatureTypeId](https://docs.nilname.com/LuaAPI/Units/UnitCreatureTypeId/) 
- [UnitFacing](https://docs.nilname.com/LuaAPI/Units/UnitFacing/) 
- [UnitFlags](https://docs.nilname.com/LuaAPI/Units/UnitFlags/) 
- UnitFlags1 
- [UnitFlags2](https://docs.nilname.com/LuaAPI/Units/UnitFlags2/) 
- [UnitFlags3](https://docs.nilname.com/LuaAPI/Units/UnitFlags3/) 
- UnitFlags4 
- [UnitMovementFlag](https://docs.nilname.com/LuaAPI/Units/UnitMovementFlag/) 
- [UnitSummoner](https://docs.nilname.com/LuaAPI/Objects/UnitSummoner/)

 

## 🧭 Movement & Positioning

 

- [ClickPosition](https://docs.nilname.com/LuaAPI/Movement/ClickPosition/) 
- [ClickToMove](https://docs.nilname.com/LuaAPI/Movement/ClickToMove/) 
- [GetCameraPosition](https://docs.nilname.com/LuaAPI/Movement/GetCameraPosition/) 
- [GetCorpsePosition](https://docs.nilname.com/LuaAPI/Movement/GetCorpsePosition/) 
- [GetPitch](https://docs.nilname.com/LuaAPI/Movement/GetPitch/) 
- [LastTerrainClick](https://docs.nilname.com/LuaAPI/Movement/LastTerrainClick/) 
- [SendMovementHeartbeat](https://docs.nilname.com/LuaAPI/Movement/SendMovementHeartbeat/) 
- [SetPitch](https://docs.nilname.com/LuaAPI/Movement/SetPitch/) 
- [SetPlayerFacing](https://docs.nilname.com/LuaAPI/Movement/SetPlayerFacing/) 
- [TraceLine](https://docs.nilname.com/LuaAPI/Movement/TraceLine/) 
- [ScreenToWorld](https://docs.nilname.com/LuaAPI/Movement/ScreenToWorld/) 
- [WorldToScreen](https://docs.nilname.com/LuaAPI/Movement/WorldToScreen/)

 

## 🧩 Miscellaneous

 

- [GetKeyState](https://docs.nilname.com/LuaAPI/Miscellaneous/GetKeyState/) 
- GetSessionID 
- [GetSessionId](https://docs.nilname.com/LuaAPI/Miscellaneous/GetSessionId/) 
- [GetSessionIndex](https://docs.nilname.com/LuaAPI/Miscellaneous/GetSessionIndex/) 
- [GetWowAccount](https://docs.nilname.com/LuaAPI/Miscellaneous/GetWowAccount/)
