<!-- Source: https://docs.nilname.com/LuaAPI/HTTP/HTTPRequest/ -->

# HTTP:Request

 

Places a new HTTP Request in the Queue

 

```lua
HTTP:Request(options)
```

 



 

## Arguments

 

- **options**
  
  - ` table ` : request object

 



 

## Details

 

- **` [REQUIRED] `** ` url ` is the request full url string 
- **` [REQUIRED] `** ` method ` can be any string aka ` GET `,` PUT `,` POST `,` OPTIONS `,` NilNAmE ` 
- *` [optional] `* ` callback ` is a function to be called after the ` Request ` completes. 
- *` [optional] `* ` headers ` is a table of string values to put as headers on the request 
- *` [optional] `* ` params ` are the request ` body ` used by every ` method ` besides ` GET ` 
- *` [optional] `* ` pin ` is a CERTPIN string

 

NOTE: ` params ` is ` body ` depending on request

 

```lua
local function httpCallback(status,result)
    print(status,result)
end

local request = {
    callback = httpCallback,
    method = "POST",
    body = "request body goes here",
    url = "https://google.com",
    headers = {"Accept: application/json", "Content-Type: application/x-www-form-urlencoded"},
    pin = "sha256//YhKJKSzoTt2b5FP18fvpHo7fJYqQCjAa3HWY3tvRMwE=;sha256//t62CeU2tQiqkexU74Gxa2eg7fRbEgoChTociMee9wno=",
}
HTTP:Request(request)
```
