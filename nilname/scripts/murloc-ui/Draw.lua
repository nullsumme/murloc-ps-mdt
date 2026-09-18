-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Fill(parent, color, layer)
    local texture = parent:CreateTexture(nil, layer or "BACKGROUND")
    texture:SetColorTexture(UI.Color(color or "widget"))
    if texture.SetSnapToPixelGrid then texture:SetSnapToPixelGrid(false) end
    if texture.SetTexelSnappingBias then texture:SetTexelSnappingBias(0) end
    return texture
end

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

local shapes = {
    close = {{0.25, 0.25, 0.75, 0.75}, {0.25, 0.75, 0.75, 0.25}},
    check = {{0.18, 0.50, 0.40, 0.73}, {0.40, 0.73, 0.82, 0.25}},
    down = {{0.23, 0.36, 0.50, 0.64}, {0.50, 0.64, 0.77, 0.36}},
    up = {{0.23, 0.64, 0.50, 0.36}, {0.50, 0.36, 0.77, 0.64}},
    plus = {{0.2, 0.5, 0.8, 0.5}, {0.5, 0.2, 0.5, 0.8}},
    minus = {{0.2, 0.5, 0.8, 0.5}},
    resize = {{0.3, 0.8, 0.8, 0.3}, {0.55, 0.8, 0.8, 0.55}},
}

-- Allocate once. Native lines where supported, bounded pixel strokes otherwise.
function UI.Icon(parent, name, size, color)
    local icon = UI.Frame("Frame", parent)
    icon:SetSize(size or 16, size or 16)
    icon.parts = {}
    icon.color = color or "text"
    local shape = assert(shapes[name], "Unknown procedural icon: " .. tostring(name))
    local segments = {}
    for _, coords in ipairs(shape) do
        local segment = {coords = coords, parts = {}}
        local count = UI.nativeLines and 1 or 12
        for i = 1, count do
            local part
            if UI.nativeLines then part = icon:CreateLine(nil, "ARTWORK")
            else part = icon:CreateTexture(nil, "ARTWORK") end
            part:SetColorTexture(UI.Color(icon.color))
            segment.parts[i] = part
            icon.parts[#icon.parts + 1] = part
        end
        segments[#segments + 1] = segment
    end
    local native = UI.nativeLines
    function icon:Redraw()
        local w, h = self:GetSize()
        for _, segment in ipairs(segments) do
            local c = segment.coords
            if native then
                local line = segment.parts[1]
                line:SetThickness(math.max(UI.Pixel(self), 1.5))
                line:SetStartPoint("TOPLEFT", self, c[1] * w, -c[2] * h)
                line:SetEndPoint("TOPLEFT", self, c[3] * w, -c[4] * h)
            else
                for i, part in ipairs(segment.parts) do
                    local t = (i - 1) / (#segment.parts - 1)
                    part:ClearAllPoints()
                    part:SetPoint("CENTER", self, "TOPLEFT",
                        (c[1] + (c[3] - c[1]) * t) * w, -(c[2] + (c[4] - c[2]) * t) * h)
                    part:SetSize(math.max(1.5, UI.Pixel(self)), math.max(1.5, UI.Pixel(self)))
                end
            end
        end
    end
    function icon:SetColor(value)
        self.color = value
        for _, part in ipairs(self.parts) do part:SetColorTexture(UI.Color(value)) end
    end
    icon:SetScript("OnSizeChanged", function(self) self:Redraw() end)
    icon:Redraw()
    return icon
end

function UI.RefreshPixels()
    for _, frame in ipairs(UI.frames) do
        if frame.UpdateBorder then frame:UpdateBorder() end
        if frame.Redraw then frame:Redraw() end
    end
end
