<!-- Source: https://docs.nilname.com/LuaAPI/HTTP/HTTPGet/ -->

# HTTP:Get

 

> ⚠️ DEPRECATED

 

Places a GET call to a HTTP API.

 

```lua
HTTP:GET(url, headers, callback)
```

 



 

## Arguments

 

- **options**
  
  - ` url ` : full web url 
- **headers**
  
  - ` table ` : key/pair table for headers 
- **callback**
  
  - ` function ` : function to handle completion of request

 



 

## Details

 

** Other variables are permitted, if you have specific questions, ask an admin.

 

```lua
local url = 'https://someApi.com' 
local headers = {"Accept: application/json", "Content-Type: application/x-www-form-urlencoded"}

local function callback(status, data)

    if status == 200 then 
     print ('Success! Your data is as follows:')
     print (data)
    else 
     print ('Failure code:', status)
    end
end
HTTP:GET(url, headers, callBack)
```
