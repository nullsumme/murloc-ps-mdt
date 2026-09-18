<!-- Source: https://docs.nilname.com/API/FileSystem/ -->

# 📂 FileSystem

 

## Paths

 

On a general note when a path starts with ` / ` or ` \\ ` will load files from the Unlocker Base Directory

 

You can still access the Current Wow Directory by just skipping those like ` [[Interface\Addons\Media\Arial.ttf]] `

 

Please Keep in mind that Windows File Paths are case-insensitive and accept both ` / ` or ` \\ `

 

## FileExists(path)

 

Returns true if the file presented in the path exists.

 

```lua
local path = '/scripts/Jumanji/test.lua'
if FileExists(path) then 
    print ('File exists!')
end
```

 

## ReadFile(path)

 

Reads the given file at the path specified into memory.

 

```lua
local path = '/scripts/Jumanji/test.lua' -- From the base of NoName
local wowpath = [[Interface\Addons\Jumanji\test.lua]] -- From the base WOW directory
-- or
local wowpath = "Interface/Addons/Jumanji/test.lua" -- From the base WOW directory
local foo = ReadFile(path)
```

 

## WriteFile(path, data[, append])

 

Save the contents of DATA to disk. Optional boolean for append. If append is not spcified, the file will be overwritten. Any data previously inside the file will be deleted. This function will do nothing if append is specified and the file does not exist.

 

```lua
local foo = { "one", "two", "three" }
local bar = NoName.JSON.encode(foo)
WriteFile('/scripts/configs/test.json', bar, false)
```

 

## DeleteFile(path)

 

Delete the file given in the path. There is no confirmation!

 

```lua
local path = '/scripts/Jumanji/test.lua'
if not FileExists(path) then print(path, 'does not exist') return end
DeleteFile(path)
print(FileExists(path) and 'There was an error!' or format('File [%s] was deleted',path))
```

 

## DirectoryExists(path)

 

Returns true if the directory presented in the path exists.

 

```lua
local path = '/scripts/Jumanji'
if DirectoryExists(path) then 
    print ('Directory exists!')
end
```

 

## CreateDirectory(path)

 

Cretae a directory given in the path.

 

```lua
local path = '/scripts/Jumanji'
CreateDirectory(path) 
```

 

## DeleteDirectory(path)

 

Delete a directory given in the path.

 

```lua
local path = '/scripts/Jumanji'
DeleteDirectory(path) 
```

 

## ListFiles(path)

 

List The Files/Directories in the specified Directory, Results are relative and the path needs to be appended to a result to get full path

 

```lua
-- note results will contain "." and ".." cause Windows
local path = '/scripts/Jumanji/*'
local foo = ListFiles(path)
for i=1, #foo do 
    print (foo[i]) -- sample output : test.lua
end
```
