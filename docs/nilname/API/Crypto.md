<!-- Source: https://docs.nilname.com/API/Crypto/ -->

# 🔐 Cryptography

 

## AES Encryption

 

All forms of AES are supported. If you find this confusing, it is. Feel free to ask for help if you do not understand or can't seem to get it to work.

 

These examples should be enough, but its Crypto. It isn't easy!

 

```lua
local aes = NoName.Utils.AES


-- Load and execute your encrypted data from a file
-- LoadScriptAES256CBC will auto insert /scripts/ into the filename

aes.LoadScriptAES256CBC(filepath, password, iv)

-- Run encrypted data that is in a string variable. usefull if you are reading the data from a remote server or ReadFile from disk.
-- the chunkname param is only used for lua errors to display something meaningful

aes.RunScriptAES256CBC(data, password, iv, "MyAesScriptName" )
```

 

A more general example:

 

```lua
local sha = NoName.Utils.sha
local aes = NoName.Utils.aes

# AES 
local iv = {0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 06}
local rawfile = ReadFile("/scripts/testme.lua")

local lomes = aes.encrypt("password", rawfile, aes.AES256, aes.CBCMODE, iv)
WriteFile("/scripts/aes256.aes", lomes, false)
print("Lomes::", lomes)

--print("Decrypted:", aes.decrypt("password", lomes, aes.AES256, aes.CBCMODE, iv))

-- LoadScriptAES256CBC assumes that your starting folder is /scripts/
aes.LoadScriptAES256CBC("aes256.aes", "password", iv)

# SHA 
print ('HMAC Information')
print (sha.sha256(rawfile)) 
print (sha.hmac_sha256('thisisakey', 'thisissometext'))
```

 

Formats supported are:

 

```lua
    AES128,
    AES192,
    AES256,
    --
    ECBMODE,
    CBCMODE,
    OFBMODE,
    CFBMODE,
    CTRMODE,
    --
```

 

## SHA & SHA256 Encryption

 

Nice utility for securing files and file versions etc. If you struggle to get this working or have an issue getting it sorted, please ask for help.

 

```lua
local sha = NoName.Utils.sha
local aes = NoName.Utils.aes

# AES 
local iv = {0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 0x1, 0x2, 0x3, 06}
local rawfile = ReadFile("/scripts/testme.lua")

local lomes = aes.encrypt("password", rawfile, aes.AES256, aes.CBCMODE, iv)
WriteFile("/scripts/aes256.aes", lomes, false)
print("Lomes::", lomes)

--print("Decrypted:", aes.decrypt("password", lomes, aes.AES256, aes.CBCMODE, iv))

-- LoadScriptAES256CBC assumes that your starting folder is /scripts/
aes.LoadScriptAES256CBC("aes256.aes", "password", iv)

# SHA 
print ('HMAC Information')
print (sha.sha256(rawfile)) 
print (sha.hmac_sha256('thisisakey', 'thisissometext'))
```

 

## JSON

 

Json Library for handling of handling Converting JSON text to/from Lua Table

 

```lua
local json = NoName.Utils.JSON

local data = {user = "user", pass = "pass"}

local encoded = json.encode(data)
local decoded = json.decode(encoded)

print(encoded)
DevTools_Dump(decoded)
DevTools_Dump(data)
```
