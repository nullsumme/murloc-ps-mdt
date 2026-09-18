<!-- Source: https://docs.nilname.com/LuaAPI/Objects/ObjectInteract/ -->

# ObjectInteract

 

Interact with a given Nn Object.

 

```lua
status = ObjectInteract(object)
```

 



 

## Arguments

 

- **object**
  
  - ` number ` : Nn Object identifier

 



 

## Returns

 

- **status**
  
  - ` boolean ` : Returns True if the interaction was successful

 



 

## Details

 

Object interaction may fail if the player is not close enough to the given object. Also beware that, if "click-to-move" is enabled, the player may start moving towards the Object.
