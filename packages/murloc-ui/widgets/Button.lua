-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Button(parent, text, width, onClick)
    local button = UI.Panel(UI.Frame("Button", parent))
    button:SetSize(width or 120, 24)
    button:RegisterForClicks("LeftButtonUp")
    button.text = UI.Label(button, text)
    button.text:SetPoint("CENTER")
    button:SetScript("OnEnter", function(self)
        if self:IsEnabled() then
            self.fill:SetColorTexture(UI.Color("hover")); self:SetBorderColor("accent")
        end
    end)
    button:SetScript("OnLeave", function(self)
        self.fill:SetColorTexture(UI.Color("widget")); self:SetBorderColor("border")
    end)
    button:SetScript("OnClick", function(self)
        if self:IsEnabled() and onClick then onClick(self) end
    end)
    function button:SetActive(enabled)
        if enabled then self:Enable() else self:Disable() end
        self:SetAlpha(enabled and 1 or 0.4)
        self.fill:SetColorTexture(UI.Color("widget")); self:SetBorderColor("border")
    end
    return button
end
