-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Dropdown(parent, width, items, selected, onChange)
    assert(#items > 0 and #items <= 12, "Dropdown supports 1-12 items")
    local menu
    local button = UI.Button(parent, "", width, function()
        if menu:IsShown() then menu:Hide(); return end
        if UI.openMenu then UI.openMenu:Hide() end
        UI.openMenu = menu
        menu:Show()
    end)
    button.text:ClearAllPoints(); button.text:SetPoint("LEFT", 8, 0)
    UI.Icon(button, "down", 16):SetPoint("RIGHT", -4, 0)
    menu = UI.Panel(UI.Frame("Frame", button), "background")
    button.menu = menu
    menu:SetSize(width, #items * 24 + 4)
    menu:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, -2)
    menu:SetFrameStrata("TOOLTIP")
    menu:EnableMouse(true)
    menu:Hide()
    menu:SetScript("OnHide", function(self) if UI.openMenu == self then UI.openMenu = nil end end)
    function button:SetValue(index, silent)
        assert(items[index], "Invalid dropdown index")
        local changed = self.value ~= index
        self.value = index
        self.text:SetText(items[index])
        menu:Hide()
        if changed and not silent and onChange then onChange(index, items[index]) end
    end
    menu.rows = {}
    for i, item in ipairs(items) do
        local index = i
        local row = UI.Button(menu, item, width - 4, function() button:SetValue(index) end)
        row:SetPoint("TOPLEFT", 2, -2 - (i - 1) * 24)
        menu.rows[i] = row
    end
    button:SetValue(selected or 1, true)
    button:SetScript("OnHide", function() menu:Hide() end)
    return button
end
