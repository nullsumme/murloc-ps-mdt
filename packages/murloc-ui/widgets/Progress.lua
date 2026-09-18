-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Progress(parent, width, height)
    local bar = UI.Panel(UI.Frame("Frame", parent), "header")
    bar:SetSize(width or 220, height or 18)
    bar.fillAmount = UI.Fill(bar, "accent", "ARTWORK")
    bar.fillAmount:SetPoint("TOPLEFT", 1, -1)
    bar.text = UI.Label(bar, "0%", 11)
    bar.text:SetPoint("CENTER")
    function bar:SetValue(value)
        self.value = UI.Clamp(value, 0, 1)
        self.fillAmount:SetSize(math.max(0.01, (self:GetWidth() - 2) * self.value), self:GetHeight() - 2)
        if self.value == 0 then self.fillAmount:Hide() else self.fillAmount:Show() end
        self.text:SetText(math.floor(self.value * 100 + 0.5) .. "%")
    end
    bar:SetScript("OnSizeChanged", function(self) self:SetValue(self.value or 0) end)
    bar:SetValue(0)
    return bar
end
