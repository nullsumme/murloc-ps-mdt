<!-- Source: https://docs.nilname.com/REST_API/readme/ -->

# Rest API

 

Endpoint: ` nilname.com/api/ `

 

Authentication is done with header ` api-key `

 

Return value model:

 

```json
{
    "message": "Some error message if not null", // ignore if null
    "data": [Object] // differs on each API return
}
```

 

## Get Balance

 

```text
GET /api/balance
```

 

Returns the amount of balance on the account.

 

Example:

 

```json
{
    "message": null,
    "data": { 
        "balance": 420.69 
    }
}
```

 

## Get Licenses

 

```text
GET /api/license/list
```

 

Returns all license keys on the account.

 

Example:

 

```json
{
    "message": null,
    "data": [
        {
            "expireDate": "0001-01-01T00:00:00",
            "durationDays": 30,
            "key": "NBRi2EA56789O123469",
            "advanced": true,
            "maxSessions": 1,
            "isExpired": false,
            "isUsed": false
        },
        ...
    ]
}
```

 

## Create Licenses

 

```text
POST /api/license/create
```

 

Creates a new license as requested, you can visit the website to get a visual

 

Example request body:

 

```json
{
    "amount": 1,
    "sessions": 1,
}
```

 

Example return:

 

```json
{
    "message": null,
    "data": { 
        "newKeys": ["NBRi2EA56789O123469"] 
    }
}
```

 

## Encrypt Scripts.nn

 

```text
POST /api/encrypt
```

 

Upload a Lua script which will get encrypted into a ` .nn ` script. You can then load this script by storing it in ` /scripts/_autoload.nn ` where the ` _ ` makes it auto load.

 

Alternatively, you may store it in ` /scripts/test.nn ` so you can use the in-game command ` /nn load test ` to load the ` test.nn ` script.

 

Example request body:

 

```text
print("this is a secret lua script")
```

 

Example return:

 

```json
?LuaQ??u????l????w????
```
