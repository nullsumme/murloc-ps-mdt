-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Slider(parent, width, minimum, maximum, step, value, onChange)
    assert(maximum > minimum and step > 0, "Invalid slider range")
    local slider = UI.Frame("Slider", parent)
    slider:SetSize(width or 220, 20)
    slider:SetOrientation("HORIZONTAL")
    slider:SetMinMaxValues(minimum, maximum)
    slider:SetValueStep(step)
    if slider.SetObeyStepOnDrag then slider:SetObeyStepOnDrag(true) end
    local track = UI.Panel(UI.Frame("Frame", slider), "header")
    track:SetPoint("LEFT", 0, 0); track:SetPoint("RIGHT", 0, 0); track:SetHeight(6)
    local thumb = UI.Fill(slider, "accent", "OVERLAY")
    thumb:SetSize(8, 18)
    slider:SetThumbTexture(thumb)
    slider:SetValue(UI.Clamp(value or minimum, minimum, maximum))
    local last = slider:GetValue()
    slider:SetScript("OnValueChanged", function(self, raw)
        local snapped = UI.Clamp(minimum + math.floor((raw - minimum) / step + 0.5) * step, minimum, maximum)
        if math.abs(snapped - raw) > 0.000001 then self:SetValue(snapped); return end
        if last ~= snapped then
            last = snapped
            if onChange then onChange(snapped) end
        end
    end)
    slider:EnableMouseWheel(true)
    slider:SetScript("OnMouseWheel", function(self, delta)
        self:SetValue(UI.Clamp(self:GetValue() + delta * step, minimum, maximum))
    end)
    return slider
end
