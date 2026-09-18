-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.ScrollList(parent, width, height, items, onSelect)
    local holder = UI.Panel(UI.Frame("Frame", parent), "header")
    holder:SetSize(width, height)
    local scroll = UI.Frame("ScrollFrame", holder)
    holder.scroll = scroll
    scroll:SetPoint("TOPLEFT", 2, -2)
    scroll:SetPoint("BOTTOMRIGHT", -14, 2)
    local content = UI.Frame("Frame", scroll)
    local rowHeight, viewport = 24, height - 4
    content:SetSize(width - 16, math.max(viewport, #items * rowHeight))
    scroll:SetScrollChild(content)
    local thumb = UI.Fill(holder, "muted", "ARTWORK")
    local range = math.max(0, #items * rowHeight - viewport)
    local thumbHeight = math.max(12, viewport * viewport / math.max(viewport, #items * rowHeight))
    thumb:SetSize(4, thumbHeight)
    function holder:SetOffset(offset)
        self.offset = UI.Clamp(offset, 0, range)
        scroll:SetVerticalScroll(self.offset)
        thumb:ClearAllPoints()
        thumb:SetPoint("TOPRIGHT", holder, "TOPRIGHT", -5,
            -2 - (range > 0 and self.offset / range * (viewport - thumbHeight) or 0))
    end
    holder:SetOffset(0)
    local function wheel(_, delta) holder:SetOffset(holder.offset - delta * rowHeight * 2) end
    scroll:EnableMouseWheel(true); scroll:SetScript("OnMouseWheel", wheel)
    holder.rows = {}
    for i, item in ipairs(items) do
        local index = i
        local row = UI.Button(content, item, width - 16, function()
            holder.selected = index
            for j, other in ipairs(holder.rows) do
                other.text:SetTextColor(UI.Color(j == index and "accent" or "text"))
            end
            if onSelect then onSelect(index, item) end
        end)
        row:SetPoint("TOPLEFT", 0, -(i - 1) * rowHeight)
        row:EnableMouseWheel(true); row:SetScript("OnMouseWheel", wheel)
        holder.rows[i] = row
    end
    return holder
end
