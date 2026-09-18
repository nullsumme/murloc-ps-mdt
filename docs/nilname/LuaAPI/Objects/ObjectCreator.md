<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectCreator/ -->

# ObjectCreator

 

Returns the Object Creator identifier for GameObject

 

```lua
creator = ObjectCreator(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **creator**
  
  - ` number ` : Creator of the given object

 



 

## Details

 

Don't confuse this one with ObjectSummoner and UnitSummoner!

 

The (battle) pets are created units, Player pets (e.g. warlock) are also summoned units but GameObject (e.g. toys) are GameObject Created
