<!-- Source: https://docs.nilname.com/LuaAPI/Miscellaneous/GetSessionIndex/ -->

# GetSessionIndex

 

Returns the Nn session index for a given machine.

 

```lua
index = GetSessionIndex()
```

 



 

## Returns

 

- **index**
  
  - ` number ` : The index, starting from 1

 



 

## Details

 

The ` index ` starts from 1 and counts how many Nn sessions have been running for a given license key on a given machine.

 

Some examples scenarios to help you understand:

 

- Launching 4 games on a single license key on the same machine will give a number between 1 and 4. 
- Launching 2 games on 2 differente machines will only give numbers between 1 and 2. 
- Launching 4 games on 2 different license key will only give numbers between 1 and 2.
