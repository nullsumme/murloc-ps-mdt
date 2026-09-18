<!-- Source: https://docs.nilname.com/Home/Getting_started_as_a_developer/ -->

# My first NilName script

 

First, you will need to create a lua file, name it ` _test.lua ` and place it in the ` /scripts/ ` folder. This will make ` _test.lua ` auto-start when entering the in-game world *(or after ` /reload `)*.

 

In this file you start with something like this:

 

```lua
local nn = ...

-- now you can invoke nn funcs, like
nn.ClickToMove(0,0,0) -- and u move to XYZ 0,0,0
```

 

## Object Manager

 

The fun starts when using the object manager that NilName provides, you can use it as follows:

 

```lua
local nn = ...

local os = Objects()
for i=1, #os do
    local o = os[i]

    -- This prints the Nn object hash/id, which is specific to Nn
    print(o) 

    -- This function is unique to Nn and is used to obtain the Type of a given Nn object
    print(ObjectType(o)) 

    -- A Wow function which is compatibility with Nn Objects (because this script is loaded by Nn)
    print(UnitName(o)) 
end
```

 

Each Nn object obtained from ` Objects() ` is located inside the game world. In the open world, this means all objects in a radius of 100y of the player. There might be some exceptions when located in small instances (like dungeons or battlegrounds) where all objects can be obtained. This may not include any types of the 'stealth' objects (players) that are hostile to one another.

 

Each 'object' can be on the following types, represented with the respective identifier:

 

```c
enum GObjectType
{
    Object = 0,
    Item = 1,
    Container = 2,
    AzeriteEmpoweredItem = 3,
    AzeriteItem = 4,
    Unit = 5,
    Player = 6,
    ActivePlayer = 7,
    GameObject = 8,
    DynamicObject = 9,
    Corpse = 10,
    AreaTrigger = 11,
    SceneObject = 12,
    Conversation = 13
}
```

 

*NOTE: these might change between expansions and/or product version*

 

A full list of APIs related to the objects can be found at [API/Objects](https://docs.nilname.com/API/Objects/), please note that some functions may not work with certain object types (e.g. ` UnitName ` and ` ObjectName `) and that some existing Wow APIs may or may not work with Nn objects.

 

### Fishing bot example

 

A very basic example of using the Nn Object Manager to automate fishing would look like this:

 

```lua
local Nn = ...

-- Obtain the Nn Object hash/id of our own player
local player = Object("player")


local function tickfish()

    -- Cast fishing if not already?
    if UnitChannelInfo("player") == nil then
        -- call our Unlock function so we can call the protected CastSpellByName Wow API
        Unlock(CastSpellByName, "Fishing")
        print("Casted fishing!")
    end

    -- Obtain all Objects in the current frame
    local os = Objects()

    for i=1, #os do
        local o = os[i]
        if ObjectType(o) == 8 then
            -- Filter all GameObjects
            local name = ObjectName(o)
            if name == "Fishing Bobber" then
                print("Found someones bobber at ", Nn.ObjectPosition(o)) -- lets print the XYZ for fun!
                -- it is a fishing Bobber, lets verify it is ours?
                if Nn.ObjectCreator(o) == player then
                    -- cool, now check if the animation flag is set to 1, which indicates the 'splash'
                    if Nn.GetObjectField(o, 0xD6, 1) == 1 then -- NOTE: the 0xD6 offset depends on the game version!
                        -- yay, we have bait, lets loot it!
                        ObjectInteract(o) -- This will interact and open the loot window!
                    end
                end
            end
        end
    end

    -- call this function again in 0.2 seconds
    C_Timer.After(0.2, tickfish)
end

-- start the ticker
tickfish()
```

 

Function ` tickfish ` defines all the steps to find a valid bobber object and interect with it when needed. *(assuming that the offset ` 0xD6 ` is correct for 'object animation flag')*

 

We can further extend this script to auto-equip a fishing pole, apply any lures if needed, and so on. However, these actions are unrelated to the Nn APIs and are left as an exercise for the reader :).

 

## Movement Example

 

Standing still near a body of water is all fun and games until you reach that level 75 fishing cap, or until your inventory is full. It's time to stretch our legs and move our player to a nearby NPC to train and/or vendor the trash we've collected.

 

Unfortunately, the Nn object manager has a 100 yard range limit, so we cannot obtain their world coordinates if we are not within the required object manager range. Luckily for us, most NPCs are located at fixed locations. This means we can obtain world coordinates from NPCs and hardcode them into our script.

 

To get started, I am located at the docks at Teldrassil, and the following two NPCs are of interest:

 

```lua
Nessa Shadowsong (Fishing Supplies)
X: 8695.224509
Y:  952.272949
Z:   12.670760

Androl Oakhand (Fisherman)
X: 8657.604492
Y:  960.567687
Z:    1.984236

-- These were obtained by running `/dump ObjectPosition("target")` in-game while having a target
```

 

I want to say Hi to Nessa and show her my junk, I do this with the following script:

 

```lua
local Nn = ...

-- Nessa's location
local tx = 8695.224509
local ty =  952.272949
local tz =   12.670760

-- Our player location
local px, py, pz = ObjectPosition("player")

-- Obtain the map we are in (the instance/dungeon/raid or continent we are in)
-- NOTE: This will not work on transport objects like tram, boat, zeppelin, etc..
local _, _, _, _, _, _, _, mapId = GetInstanceInfo()
local path = Nn.GenerateLocalPath(mapId, px, py, pz, tx, ty, tz)

-- lets make sure the path is not empty (this may happen if NnNav is not running, or no mesh/path was found)
if #path > 1 then
    -- valid, lets navigate it!

    -- keep a state of things
    local pathIndex = 2 -- we are located at point 1, so start with 2

    -- asked ChatGPT to make me this, I failed math in high school
    local function distance3D(x1, y1, z1, x2, y2, z2)
        local dx = x2 - x1
        local dy = y2 - y1
        local dz = z2 - z1
        return math.sqrt(dx*dx + dy*dy + dz*dz)
    end

    -- make a tick function we can keep invoking after every X time while the player walks
    local function tickwalk()
        -- check if destination was reached?
        local px, py, pz = ObjectPosition("player")
        local tx = tonumber(path[pathIndex].x)
        local ty = tonumber(path[pathIndex].y)
        local tz = tonumber(path[pathIndex].z)

        local distance = distance3D(px, py, pz, tx, ty, tz)
        if distance < 0.95 then
            -- make sure its not the end?
            if pathIndex >= #path then
                print("We have arrived! say hello to Nessa <3")
                return
            end

            -- set the next point!
            pathIndex = pathIndex + 1
            tx = tonumber(path[pathIndex].x)
            ty = tonumber(path[pathIndex].y)
            tz = tonumber(path[pathIndex].z)

            -- start moving to it
            Nn.ClickToMove(tx, ty, tz)
            print("Moving to", tx, ty, tz)
        end

        -- check again in 0.2 seconds
        C_Timer.After(0.2, tickwalk)
    end

    -- make sure its numerical, then click on first point
    Nn.ClickToMove(tonumber(path[pathIndex].x), tonumber(path[pathIndex].y), tonumber(path[pathIndex].z))
    print("Moving to", path[pathIndex].x, path[pathIndex].y, path[pathIndex].z)
    tickwalk()
end
```

 

This will make us walk to Nessa where we can vendor our junk. Once again, handeling the player inventory is left as an exercise for the reader.

 

## What is next?

 

Automated all the things? lovely, time to share it with friends :3
