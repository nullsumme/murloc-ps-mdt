-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

-- Header/body composition adapted from AbstractFramework Widgets/Frame.lua.
function UI.Window(title, width, height)
    local frame = UI.Panel(UI.Frame("Frame"), "background")
    frame:SetSize(width or 620, height or 560)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    local header = UI.Panel(UI.Frame("Frame", frame), "header")
    frame.header = header
    header:SetPoint("TOPLEFT"); header:SetPoint("TOPRIGHT"); header:SetHeight(28)
    header:EnableMouse(true)
    header:RegisterForDrag("LeftButton")
    header:SetScript("OnDragStart", function() frame:StartMoving() end)
    header:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    local heading = UI.Label(header, title, 13, "accent")
    heading:SetPoint("LEFT", 10, 0)
    local close = UI.Button(header, "", 28, function() frame:Hide() end)
    close:SetHeight(28); close:SetPoint("RIGHT")
    UI.Icon(close, "close", 18):SetPoint("CENTER")
    frame.body = UI.Frame("Frame", frame)
    frame.body:SetPoint("TOPLEFT", 14, -42)
    frame.body:SetPoint("BOTTOMRIGHT", -14, 14)
    frame:SetScript("OnHide", function()
        frame:StopMovingOrSizing()
        if UI.openMenu then UI.openMenu:Hide() end
        if UI.tooltip then UI.tooltip:Hide() end
    end)
    return frame
end
