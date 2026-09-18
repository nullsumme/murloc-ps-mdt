local function attempt(manifest, implement)
    local calls, order = 0, {}
    local Nn = {}
    function Nn:Require(path, UI)
        if path:match('/manifest.lua$') then UI.manifest = manifest; return end
        calls = calls + 1
        order[#order + 1] = path
        if implement then implement(path, UI) end
    end
    local UI = {}
    local ok, reason = pcall(assert(loadfile(INIT_PATH)), Nn, UI, '/custom')
    return ok, tostring(reason), calls, order, UI
end
local function module(id, requires)
    return {id = id, file = id .. '.lua', requires = requires or {}, exports = {}}
end
local ok, reason, calls = attempt({module('a', {'missing'})})
assert(not ok and reason:find('Missing module dependency') and calls == 0)
ok, reason, calls = attempt({module('a', {'b'}), module('b', {'a'})})
assert(not ok and reason:find('Circular module dependency') and calls == 0)
ok, reason, calls = attempt({module('a'), module('a')})
assert(not ok and reason:find('Duplicate') and calls == 0)
local a = module('a'); a.file = '../escape.lua'
ok, reason, calls = attempt({a})
assert(not ok and reason:find('Invalid module path') and calls == 0)
a = module('a'); a.exports = {'RequiredFunction'}
ok, reason = attempt({a})
assert(not ok and reason:find('did not export RequiredFunction'))
local order, UI
ok, reason, calls, order, UI = attempt({module('a', {'b'}), module('b')})
assert(ok and calls == 2 and order[1] == '/custom/b.lua' and order[2] == '/custom/a.lua')
assert(UI.loaded and UI.loadedModules.a and UI.loadedModules.b)

local cleaned = false
local lifecycle = module('lifecycle'); lifecycle.exports = {'Dispose'}
local broken = module('broken', {'lifecycle'}); broken.exports = {'Missing'}
ok, reason, calls, order, UI = attempt({broken, lifecycle}, function(path, target)
    if path == '/custom/lifecycle.lua' then
        target.Dispose = function() cleaned = true end
    end
end)
assert(not ok and cleaned and UI._loadError and not UI.loaded and not UI._loading)
local retry = pcall(assert(loadfile(INIT_PATH)), {Require = function() error('Must not run') end}, UI)
assert(not retry, 'A failed export table must not be reused')
