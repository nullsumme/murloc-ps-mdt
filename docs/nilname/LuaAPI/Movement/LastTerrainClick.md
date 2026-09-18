<!-- Source: https://docs.nilname.com/LuaAPI/Movement/LastTerrainClick/ -->

# LastTerrainClick

 

Returns the world coords for the last clicked point.

 

```lua
x, y, z = LastTerrainClick()
```

 



 

## Returns

 

- **x**
  
  - ` number ` : The X-axis world coord 
- **y**
  
  - ` number ` : The Y-axis world coord 
- **z**
  
  - ` number ` : The Z-axis world coord

 



 

## Details

 

You may poll this API and wait for the x,y,z to change so you can register when the user has clicked something in-game.
