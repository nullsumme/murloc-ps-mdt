<!-- Source: https://docs.nilname.com/API/Objects/ -->

# Objects

 

## Objects()

 

Returns a table of all of the current objects in the object manager.

 

```lua
local objects = Objects()

for v,k in pairs(objects) do
    print(UnitName(k))
end
```

 

## ObjectManager(type)

 

Returns a table of all objects in the object manager of the specific type.

 

It is highly recommended to use this instead of doing ` Objects() ` followed by ` ObjectType ` for every object in the game as it **greatly impacts performance** with an order of magnitudes!

 

```lua
local foo = ObjectManager("Unit" or 5) or {}
print ('There are, ' .. #foo .. ' in the object manager')
```

 

## ~~ObjectByIndex(index)~~

 

Returns the object by using its index. *(Please do not use this for the sake of performance!)*

 

```lua
local foo = ObjectByIndex(index)
```

 

## ObjectType(object)

 

Returns the numeric value for the given object as a type. *(Please note that ` ObjectManager(type) ` performs this operation much faster in combation with ` Objects() `)*

 

```lua
local foo = ObjectType(object)
if foo == 5 then
    print ('You are a UNIT')
end
```

 

```lua
  enums.om.type = IsRetail and { -- Retail Om Types
    Object = 0,
    Item = 1,
    Container = 2,
    AzeriteEmpoweredItem = 3,
    AzeriteItem = 4,
    Unit = 5,
    Player = 6,
    ActivePlayer = 7,
    GameObject = 8,
    DynamicObject = 9,
    Corpse = 10,
    AreaTrigger = 11,
    SceneObject = 12,
    Conversation = 13
  } or { -- Classic Types
    Object = 0,
    Item = 1,
    Container = 2,
    Unk3 = 3,
    Unk4 = 4,
    Unit = 5,
    Player = 6,
    ActivePlayer = 7,
    GameObject = 8,
    Unk9 = 9,
    Unk10 = 10,
    Unk11 = 11,
    Unk12 = 12,
    Unk13 = 13
  }
```

 

## PlayerObject()

 

Returns the players object.

 

```lua
local foo = PlayerObject()
```

 

## ObjectPointer(obj)

 

Returns the objects pointer. Not really needed, but some requested it.

 

```lua
local pointer = ObjectPointer(object) 
```

 

## ObjectCreator(obj)

 

Returns the OBJECT of the creator (critters such as snakes you buy from the snake vendor in Org or Stormwind).

 

```lua
if ObjectExists(k) and ObjectType(k) == 5 then
    print ('Name:', ObjectName(k), 'PlayerObject:' .. PlayerObject(), 'ObjCreator:' .. ObjectCreator(k), 'ObjSummoner:' .. ObjectSummoner(k) )
    if ObjectCreator(k) ~= 0 then 
        print(ObjectName(ObjectCreator(k)))
    end
end
```

 

## ObjectExists(object)

 

Returns whether or not the object is actually in the object manager. *Returns a boolean.*

 

```lua
if ObjectExists(obj) then
    print('Object is Valid!')
else
    print('Object is NOT Valid!')
end
```

 

## ObjectID(object | unit)

 

Returns the objects UNIT ID.

 

```lua
local foo = ObjectID(obj)
print ('Object ID for this object is:', foo)
```

 

## ObjectInteract(object)

 

Interact with the given object (as if you right clicked on the unit or object)

 

```lua
if ObjectName(obj) == 'Mailbox' then
    ObjectInteract(obj)
end
```

 

## GameObjectType(object)

 

Returns the game objects type. This is more of a subtype.

 

```text
1 - Door 
7 - Chair 
13 - Mailbox
```

 

```lua
for v,k in pairs(Objects()) do
    if ObjectType(k) == 8 then 
        print (GameObjectType(k))
    end 
end 
```

 

## ObjectField(obj, hex, type)

 

Returns memory information.

 

```lua
local foo = ObjectField(object, 0xD568, 5)
print ('Summoned by:', foo)
```

 

```lua
1 - BYTE (1 byte)
2 - WORD (2 bytes)
3 - DWORD (4 bytes)
4 - float (decimal number)
5 - object id (number)
```

 

## DynamicFlags(object)

 

Returns the objects dynamic flags.

 

```lua
if DynamicFlags(object) == 12 then 
    print ('You are falling?')
end
```

 

## ObjectFacing(object)

 

Returns the direction of the object, that it is facing.

 

```lua
local foo = ObjectFacing(obj)
print ('Object is facing:', foo)
```

 

## UnitFlags1(object | unit)

 

Returns the unit flag 1.

 

```lua
if UnitFlags1(obj) == 'foo' then 
    print ('Bar') 
end 
```

 

## UnitFlags2(object | unit)

 

Returns the unit flag 2.

 

```lua
if UnitFlags2(obj) == 'foo' then 
    print ('Bar') 
end 
```

 

## UnitFlags3(object | unit)

 

Returns the unit flag 3.

 

```lua
if UnitFlags3(obj) == 'foo' then 
    print ('Bar') 
end 
```

 

## UnitMovementFlag(object | unit)

 

Returns the object / units movement flag.

 

```lua
if UnitMovementFlag(obj) == 1 then
    print ('You are moving forward')
        else 
    print ('You are not moving forward')
end 
```

 

## ObjectName(object | unit)

 

Returns the name of the given object.

 

```lua
local foo = ObjectName(obj)
print('Object Name is:', foo)
```

 

## ObjectLootable(object)

 

Returns true if the unit can be looted.

 

```lua
if ObjectLootable(obj) then
    ObjectInteract(obj)
    print('Auto looted!')
end
```

 

## ObjectSkinnable()

 

Returns returns true if the unit can be skinned. False otherwise.

 

```lua
if ObjectSkinnable(object) then
    print ('Object can be skinned!')
end
```

 

## ObjectSummoner()

 

Returns the OBJECT of the summoner of the unit (summoned as in pets).

 

```lua
if ObjectExists(k) and ObjectType(k) == 5 then
    print ('Name:',ObjectName(k), 'PlayerObject:' .. PlayerObject(), 'ObjCreator:' .. ObjectCreator(k), 'ObjSummoner:' .. ObjectSummoner(k) )
    if ObjectCreator(k) ~= 0 then print (ObjectName(ObjectCreator(k)) )
    end
end
```

 

## ObjectRotation()

 

Returns the objects rotation.

 

```lua
local myRotation = ObjectRotation('player') 
```

 

## ObjectYaw()

 

Returns the objects yaw.



```LUA
local myYaw = ObjectYaw('player') 
```





 

## PlayerTarget()

 

Returns the targets object

 

```lua
local foo = PlayerTarget()
```

 

## UnitTarget(object)

 

Returns the OBJECTS target object

 

```lua
local foo = UnitTarget(object)
```
