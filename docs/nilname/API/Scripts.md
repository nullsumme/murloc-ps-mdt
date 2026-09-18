<!-- Source: https://docs.nilname.com/API/Scripts/ -->

# 📜 Scripts

 

## Script Environment

 

All of Nn API is generally available within it's own lua environment which is passed along to any loaded script

 

Any API that currently is also available in ` _G ` is **ONLY** there for testing purposes and can be **removed** at any point

 

```lua
local Nn = ...

-- exposing to _G for purely testing purposes
_G.NnEnv = getfenv(1) or Nn
```

 

## Script Loading

 

Nn provides the following API for loading scripts besides the files already starting with an ` _ ` *(underscore)* inside your ` /scripts ` subdirectory

 

For example: ` /scripts/_runme.lua ` will execute every time you are in-game at client load/reload

 

### Require

 

```lua
-- grab additional Require arguments passed if any
local Nn, arg1, arg2 = ... 

-- we can pass additional arguments that the file can access if we desire
Nn:Require('/scripts/test.lua', arg1, arg2, ...) 
Nn:Require('/scripts/obf.nn')

-- this will load file mine.nn or mine.lua whichever it finds existing
Nn:Require('/scripts/mine', arg1, arg2, ...) 
```

 

## Deprecated

 

### RequireFileEnc / RequireLuaFile

 

```lua
-- same arguments as Require above
Nn:RequireFileEnc() -- only loads .nn files
Nn:RequireLuaFile() -- only loads .lua files
```
