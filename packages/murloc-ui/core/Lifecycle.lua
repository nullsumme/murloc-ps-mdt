-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

UI.frames = {}
UI.disposed = false

function UI.Dispose()
    if UI.disposed then return end
    if UI.openMenu then UI.openMenu:Hide() end
    -- WoW frames cannot be deleted. Remove handlers and hide all owned frames.
    for i = #UI.frames, 1, -1 do
        local frame = UI.frames[i]
        if frame.ClearFocus then frame:ClearFocus() end
        for _, script in ipairs({"OnUpdate", "OnEvent", "OnClick", "OnEnter", "OnLeave",
            "OnMouseDown", "OnMouseUp", "OnMouseWheel", "OnDragStart", "OnDragStop",
            "OnValueChanged", "OnTextChanged", "OnEnterPressed", "OnEscapePressed",
            "OnHide", "OnSizeChanged"}) do
            if frame:HasScript(script) then frame:SetScript(script, nil) end
        end
        frame:UnregisterAllEvents()
        frame:Hide()
    end
    UI.disposed = true
    if UI.onDispose then UI.onDispose() end
end
