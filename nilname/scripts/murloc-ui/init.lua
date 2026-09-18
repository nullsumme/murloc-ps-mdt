-- SPDX-License-Identifier: GPL-3.0-only
-- NilName supplies Nn first, then the caller-owned export table.
local Nn, UI, base = ...
assert(type(UI) == "table", "Pass an export table: Nn:Require(path, UI)")
assert(Nn and type(Nn.Require) == "function", "NilName Require is unavailable")
base = base or "/scripts/murloc-ui"
UI.version = "0.1.0"
UI.nn = Nn
for _, file in ipairs({"Core", "Draw", "Widgets"}) do
    Nn:Require(base .. "/" .. file .. ".lua", UI)
end
UI.loaded = true
