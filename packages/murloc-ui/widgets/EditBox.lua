-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.EditBox(parent, width, value, onChange)
    local box = UI.Panel(UI.Frame("EditBox", parent))
    box:SetSize(width or 220, 26)
    box:SetAutoFocus(false)
    local font, _, flags = UI.WoW.Font()
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
