-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Panel(frame, color)
    frame.fill = UI.Fill(frame, color or "widget")
    frame.fill:SetAllPoints(frame)
    frame.edges = {}
    for i = 1, 4 do frame.edges[i] = UI.Fill(frame, "border", "BORDER") end
    function frame:UpdateBorder()
        local p = UI.Pixel(self)
        local top, bottom, left, right = self.edges[1], self.edges[2], self.edges[3], self.edges[4]
        top:SetPoint("TOPLEFT"); top:SetPoint("TOPRIGHT"); top:SetHeight(p)
        bottom:SetPoint("BOTTOMLEFT"); bottom:SetPoint("BOTTOMRIGHT"); bottom:SetHeight(p)
        left:SetPoint("TOPLEFT"); left:SetPoint("BOTTOMLEFT"); left:SetWidth(p)
        right:SetPoint("TOPRIGHT"); right:SetPoint("BOTTOMRIGHT"); right:SetWidth(p)
    end
    function frame:SetBorderColor(value)
        for _, edge in ipairs(self.edges) do edge:SetColorTexture(UI.Color(value)) end
    end
    frame:UpdateBorder()
    return frame
end
