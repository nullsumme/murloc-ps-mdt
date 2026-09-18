-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Tooltip(target, text)
    target:HookScript("OnEnter", function(self)
        if self.IsEnabled and not self:IsEnabled() then return end
        if not UI.tooltip then
            UI.tooltip = UI.Panel(UI.Frame("Frame"), "background")
            UI.tooltip:SetFrameStrata("TOOLTIP")
            UI.tooltip:SetClampedToScreen(true)
            UI.tooltip.text = UI.Label(UI.tooltip, "", 12)
            UI.tooltip.text:SetPoint("TOPLEFT", 8, -8)
            UI.tooltip.text:SetWidth(244)
            UI.tooltip.text:SetWordWrap(true)
        end
        local tip = UI.tooltip
        tip.text:SetText(text)
        tip:SetSize(260, tip.text:GetStringHeight() + 16)
        tip:ClearAllPoints(); tip:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 4)
        tip:Show()
    end)
    target:HookScript("OnLeave", function() if UI.tooltip then UI.tooltip:Hide() end end)
    target:HookScript("OnHide", function() if UI.tooltip then UI.tooltip:Hide() end end)
end
