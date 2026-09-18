-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Label(parent, text, size, color)
    local label = parent:CreateFontString(nil, "OVERLAY")
    local font, _, flags = UI.WoW.Font()
    label:SetFont(font, size or 12, flags or "")
    label:SetTextColor(UI.Color(color or "text"))
    label:SetJustifyH("LEFT")
    label:SetText(text or "")
    return label
end
