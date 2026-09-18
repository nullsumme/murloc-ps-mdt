-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Frame(kind, parent)
    assert(not UI.disposed, "Murloc UI instance was disposed")
    local frame = UI.WoW.CreateFrame(kind or "Frame", parent)
    UI.frames[#UI.frames + 1] = frame
    return frame
end
