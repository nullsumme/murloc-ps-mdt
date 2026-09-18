-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI, base = ...
assert(type(UI) == "table", "Pass an export table: Nn:Require(path, UI)")
assert(Nn and type(Nn.Require) == "function", "NilName Require is unavailable")
assert(not UI.disposed and not UI._loadError, "Use a fresh export table after disposal or failed loading")
if UI.loaded then return end
assert(not UI._loading, "Recursive Murloc UI initialization")
base = base or "/scripts/murloc-ui"
UI.version = "0.2.0"
UI.targetClient = "Retail"
UI.nn = Nn
UI._loading = true
UI.loadedModules = {}

local ok, reason = pcall(function()
    Nn:Require(base .. "/manifest.lua", UI)
    assert(type(UI.manifest) == "table", "Missing module manifest")
    local modules, exports, files = {}, {}, {}
    for _, module in ipairs(UI.manifest) do
        assert(type(module.id) == "string" and not modules[module.id], "Duplicate or invalid module ID")
        assert(type(module.file) == "string" and module.file:match("^[%w_/-]+%.lua$")
            and not module.file:match("^/"), "Invalid module path: " .. tostring(module.file))
        assert(not files[module.file], "Duplicate module file: " .. module.file)
        assert(type(module.requires) == "table" and type(module.exports) == "table", "Missing module contract")
        modules[module.id], files[module.file] = module, true
        for _, symbol in ipairs(module.exports) do
            assert(not exports[symbol], "Duplicate exported symbol: " .. symbol)
            exports[symbol] = module.id
        end
    end
    local order, visiting, visited = {}, {}, {}
    local function visit(id)
        assert(modules[id], "Missing module dependency: " .. id)
        assert(not visiting[id], "Circular module dependency: " .. id)
        if visited[id] then return end
        visiting[id] = true
        for _, dependency in ipairs(modules[id].requires) do visit(dependency) end
        visiting[id], visited[id] = nil, true
        order[#order + 1] = modules[id]
    end
    for _, module in ipairs(UI.manifest) do visit(module.id) end
    for _, module in ipairs(order) do
        Nn:Require(base .. "/" .. module.file, UI)
        for _, symbol in ipairs(module.exports) do
            assert(UI[symbol] ~= nil, module.id .. " did not export " .. symbol)
        end
        UI.loadedModules[module.id] = true
    end
end)
UI._loading = nil
if not ok then
    if UI.Dispose then pcall(UI.Dispose) end
    UI._loadError = tostring(reason)
    error("Murloc UI initialization failed: " .. tostring(reason))
end
UI.loaded = true
