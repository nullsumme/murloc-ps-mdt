-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

-- Host entry points live here; widgets use returned WoW region objects.
-- Retail is the first target. Availability is checked by Probe, not assumed.
UI.WoW = {}
function UI.WoW.CheckFrames()
    assert(type(CreateFrame) == "function" and UIParent, "CreateFrame/UIParent missing")
end
function UI.WoW.CreateFrame(kind, parent)
    return CreateFrame(kind, nil, parent or UIParent)
end
function UI.WoW.Font()
    return GameFontNormal:GetFont()
end
function UI.WoW.ScreenHeight()
    if type(GetPhysicalScreenSize) == "function" then
        local _, height = GetPhysicalScreenSize()
        if height and height > 0 then return height end
    end
    return 768
end
