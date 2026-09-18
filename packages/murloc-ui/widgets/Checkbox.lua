-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Checkbox(parent, text, value, onChange)
    local control = UI.Frame("Button", parent)
    control:SetSize(260, 22)
    control:RegisterForClicks("LeftButtonUp")
    control.box = UI.Panel(UI.Frame("Frame", control))
    control.box:SetSize(18, 18); control.box:SetPoint("LEFT")
    control.mark = UI.Icon(control.box, "check", 18, "accent")
    control.mark:SetPoint("CENTER")
    control.text = UI.Label(control, text)
    control.text:SetPoint("LEFT", control.box, "RIGHT", 8, 0)
    function control:SetValue(checked, silent)
        checked = not not checked
        local changed = self.value ~= checked
        self.value = checked
        if checked then self.mark:Show() else self.mark:Hide() end
        if changed and not silent and onChange then onChange(checked) end
    end
    control:SetScript("OnClick", function(self) self:SetValue(not self.value) end)
    control:SetScript("OnEnter", function(self) self.box:SetBorderColor("accent") end)
    control:SetScript("OnLeave", function(self) self.box:SetBorderColor("border") end)
    control:SetValue(value, true)
    return control
end
