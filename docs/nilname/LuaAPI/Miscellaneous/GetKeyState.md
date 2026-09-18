<!-- Source: https://docs.nilname.com/LuaAPI/Miscellaneous/GetKeyState/ -->

# GetKeyState

 

Returns keyboard pressed key info.

 

```lua
flag = GetKeyState(virtKey)
```

 



 

## Arguments

 

- **virtKey**
  
  - ` number ` : virtual key *(there is a list below)*

 



 

## Returns

 

- **flag**
  
  - ` number ` : falgs

 



 

## Details

 

The ` flags ` return value specifies the status of the specified virtual key, as follows: - If the high-order bit is 1, the key is down; otherwise, it is up. - If the low-order bit is 1, the key is toggled. A key, such as the CAPS LOCK key, is toggled if it is turned on. The key is off and untoggled if the low-order bit is 0. A toggle key's indicator light (if any) on the keyboard will be on when the key is toggled, and off when the key is untoggled.

 



 

Enjoy this [virtual key codes list](https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes).
