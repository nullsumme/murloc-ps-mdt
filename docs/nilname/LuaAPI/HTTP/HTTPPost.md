<!-- Source: https://docs.nilname.com/LuaAPI/HTTP/HTTPPost/ -->

# HTTP:Post

 

> ⚠️ DEPRECATED

 

Places a POST call to a HTTP API.

 

```lua
HTTP:POST(url, postdata, callback)
```

 



 

## Arguments

 

- **options**
  
  - ` url ` : full web url 
- **postdata**
  
  - ` string ` : raw string to be in HTTP body 
- **callback**
  
  - ` function ` : function to handle completion of request

 



 

## Details

 

** Other varaibles are permitted, if you have specific questions, ask an admin.

 

```lua
local url = 'https://httpbin.org/post?clue=yes&something=no' 
local postData =  "token: '1234567890abc', username: 'JackBauer'"

local function callback(status, data)

    if status == 200 then 
     print ('Success! Your data is as follows:')
     print (data)
    else 
     print ('Failure code:', status)
    end
end
HTTP:POST(url, postData, callback)
```
