-- SPDX-License-Identifier: GPL-3.0-only
-- UI laboratory lifecycle. Packaged separately from the reusable library.
local Nn = ...
local registry = _G
local previous = registry.MurlocUIExample
-- Re-running the entry script reuses the UI, avoiding orphan frames/hooks.
if previous and not previous.ui.disposed then
    previous.window:Show()
    print("Murloc UI: existing example shown. Use /reload to load source changes.")
    return
end
local UI = {}
local ok, err = pcall(function()
    Nn:Require("/scripts/murloc-ui/init.lua", UI)
    local ready, results = UI.Probe()
    print("Murloc UI " .. UI.version .. " capability report:")
    for _, result in ipairs(results) do
        print((result.ok and "[OK] " or "[FAIL] ") .. result.name .. ": " .. result.detail)
    end
    assert(ready, "Required UI capability missing; see the report above")
    local Lab = {}
    Nn:Require('/scripts/murloc-ui-lab/scenes/Overview.lua', Lab)
    local app = Lab.BuildOverview(UI)
    local window = app.window
    local events = UI.Frame("Frame", window)
    events:RegisterEvent("UI_SCALE_CHANGED")
    events:SetScript("OnEvent", function() UI.RefreshPixels() end)
    app.ui = UI
    registry.MurlocUIExample = app
    local slashHandler
    if registry.SlashCmdList then
        registry.SLASH_MURLOCUIEXAMPLE1 = "/murlocui"
        slashHandler = function()
            if window:IsShown() then window:Hide() else window:Show() end
        end
        registry.SlashCmdList.MURLOCUIEXAMPLE = slashHandler
    end
    UI.onDispose = function()
        if registry.MurlocUIExample and registry.MurlocUIExample.ui == UI then
            registry.MurlocUIExample = nil
        end
        if registry.SlashCmdList and registry.SlashCmdList.MURLOCUIEXAMPLE == slashHandler then
            registry.SlashCmdList.MURLOCUIEXAMPLE = nil
            registry.SLASH_MURLOCUIEXAMPLE1 = nil
        end
    end
    window:Show()
end)
if not ok then
    if UI.Dispose then UI.Dispose() end
    print("Murloc UI startup failed: " .. tostring(err))
end
