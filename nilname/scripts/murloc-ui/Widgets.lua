-- SPDX-License-Identifier: GPL-3.0-only
-- Header/body composition adapted from AbstractFramework; procedural controls
-- and NilName lifecycle replace addon templates and media dependencies.
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

function UI.EditBox(parent, width, value, onChange)
    local box = UI.Panel(UI.Frame("EditBox", parent))
    box:SetSize(width or 220, 26)
    box:SetAutoFocus(false)
    local font, _, flags = GameFontNormal:GetFont()
    box:SetFont(font, 12, flags or "")
    box:SetTextColor(UI.Color("text"))
    box:SetTextInsets(7, 7, 0, 0)
    box:SetMaxLetters(200)
    box:SetText(value or "")
    box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    box:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    box:SetScript("OnHide", function(self) self:ClearFocus() end)
    box:SetScript("OnTextChanged", function(self, userInput)
        if userInput and onChange then onChange(self:GetText()) end
    end)
    return box
end

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

function UI.Dropdown(parent, width, items, selected, onChange)
    assert(#items > 0 and #items <= 12, "Dropdown supports 1-12 items")
    local menu
    local button = UI.Button(parent, "", width, function()
        if menu:IsShown() then menu:Hide(); return end
        if UI.openMenu then UI.openMenu:Hide() end
        UI.openMenu = menu
        menu:Show()
    end)
    button.text:ClearAllPoints(); button.text:SetPoint("LEFT", 8, 0)
    UI.Icon(button, "down", 16):SetPoint("RIGHT", -4, 0)
    menu = UI.Panel(UI.Frame("Frame", button), "background")
    button.menu = menu
    menu:SetSize(width, #items * 24 + 4)
    menu:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, -2)
    menu:SetFrameStrata("TOOLTIP")
    menu:EnableMouse(true)
    menu:Hide()
    menu:SetScript("OnHide", function(self) if UI.openMenu == self then UI.openMenu = nil end end)
    function button:SetValue(index, silent)
        assert(items[index], "Invalid dropdown index")
        local changed = self.value ~= index
        self.value = index
        self.text:SetText(items[index])
        menu:Hide()
        if changed and not silent and onChange then onChange(index, items[index]) end
    end
    menu.rows = {}
    for i, item in ipairs(items) do
        local index = i
        local row = UI.Button(menu, item, width - 4, function() button:SetValue(index) end)
        row:SetPoint("TOPLEFT", 2, -2 - (i - 1) * 24)
        menu.rows[i] = row
    end
    button:SetValue(selected or 1, true)
    button:SetScript("OnHide", function() menu:Hide() end)
    return button
end

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
