-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

-- Pixel conversion adapted from AbstractFramework Utils/PixelUtil.lua.
function UI.Pixel(region)
    local height = UI.WoW.ScreenHeight()
    return (768 / height) / math.max(region:GetEffectiveScale(), 0.01)
end

function UI.Place(frame, parent, x, y, width, height)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, -y)
    frame:SetSize(width, height)
    return frame
end

function UI.RefreshPixels()
    for _, frame in ipairs(UI.frames) do
        if frame.UpdateBorder then frame:UpdateBorder() end
        if frame.Redraw then frame:Redraw() end
    end
end
