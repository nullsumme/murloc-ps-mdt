-- SPDX-License-Identifier: GPL-3.0-only
-- Copy the contents of nilname/scripts/ into NilName's scripts/ directory.
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
    local window = UI.Window("MURLOC  /  UI laboratory", 640, 580)
    local body = window.body
    local function label(text, x, y, size, color)
        local item = UI.Label(body, text, size, color)
        item:SetPoint("TOPLEFT", x, -y)
        return item
    end
    label("AbstractFramework style. Pure Lua rendering.", 0, 0, 14)
    label("No image files  /  No XML  /  No addon dependency", 0, 23, 11, "muted")
    local status = label("Ready. Interact with the controls below.", 0, 486, 11, "success")
    status:SetWidth(600); status:SetWordWrap(true)
    local function report(text) status:SetText(text) end

    label("CONTROLS", 0, 60, 11, "accent")
    label("PREVIEW", 322, 60, 11, "accent")
    local clicks = 0
    local action = UI.Button(body, "Test action", 134, function()
        clicks = clicks + 1; report("Button clicked " .. clicks .. " time(s).")
    end)
    action:SetPoint("TOPLEFT", 0, -83)
    UI.Tooltip(action, "A Lua-created tooltip. This button only counts clicks; it performs no game actions.")
    local disabled = UI.Button(body, "Disabled", 134)
    disabled:SetPoint("TOPLEFT", 144, -83); disabled:SetActive(false)
    local check = UI.Checkbox(body, "Enable test action", true, function(value)
        action:SetActive(value); report(value and "Action enabled" or "Action disabled")
    end)
    check:SetPoint("TOPLEFT", 0, -121)
    local previewTitle = label("My first NilName plugin", 322, 86, 13)
    previewTitle:SetWidth(280)
    label("Window label", 0, 156, 11, "muted")
    local input = UI.EditBox(body, 278, "My first NilName plugin", function(value)
        previewTitle:SetText(value)
    end)
    input:SetPoint("TOPLEFT", 0, -176)
    label("Progress", 0, 219, 11, "muted")
    local bar = UI.Progress(body, 278, 22)
    bar:SetPoint("TOPLEFT", 322, -121); bar:SetValue(0.65)
    local slider = UI.Slider(body, 278, 0, 100, 1, 65, function(value) bar:SetValue(value / 100) end)
    slider:SetPoint("TOPLEFT", 0, -239)
    label("Selection", 0, 279, 11, "muted")
    local dropdown = UI.Dropdown(body, 278, {"Default", "Compact", "Detailed"}, 1,
        function(_, text) report("Selected: " .. text) end)
    dropdown:SetPoint("TOPLEFT", 0, -299)
    label("UI scale", 0, 342, 11, "muted")
    -- Apply explicitly so scaling does not move the thumb while dragging.
    local scale = UI.Slider(body, 278, 75, 125, 5, 100)
    scale:SetPoint("TOPLEFT", 0, -362)
    local apply = UI.Button(body, "Apply scale", 134, function()
        window:SetScale(scale:GetValue() / 100); UI.RefreshPixels()
        report("UI scale: " .. scale:GetValue() .. "%")
    end)
    apply:SetPoint("TOPLEFT", 0, -393)
    local reset = UI.Button(body, "Center window", 134, function()
        window:ClearAllPoints(); window:SetPoint("CENTER")
    end)
    reset:SetPoint("TOPLEFT", 144, -393)
    label("PROCEDURAL ICONS", 322, 169, 11, "muted")
    for i, name in ipairs({"close", "check", "down", "up", "plus", "minus", "resize"}) do
        UI.Icon(body, name, 24, "accent"):SetPoint("TOPLEFT", 322 + (i - 1) * 38, -193)
    end
    label("SCROLL + SELECT", 322, 239, 11, "muted")
    local items = {}
    for i = 1, 16 do items[i] = string.format("Example row %02d", i) end
    local list = UI.ScrollList(body, 278, 156, items, function(_, text) report(text .. " selected") end)
    list:SetPoint("TOPLEFT", 322, -260)
    label(UI.nativeLines and "Renderer: native lines" or "Renderer: pixel-stroke fallback", 0, 449, 11, "muted")
    label("Drag the title bar. /murlocui toggles this window.", 0, 467, 11, "muted")
    local events = UI.Frame("Frame", window)
    events:RegisterEvent("UI_SCALE_CHANGED")
    events:SetScript("OnEvent", function() UI.RefreshPixels() end)
    registry.MurlocUIExample = {ui = UI, window = window, input = input, slider = slider,
        checkbox = check, action = action, dropdown = dropdown, list = list}
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
