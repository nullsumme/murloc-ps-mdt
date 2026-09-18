-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

-- Palette adapted from AbstractFramework Widgets/Color.lua; see THIRD_PARTY.md.
local unpack = unpack or table.unpack
UI.colors = {
    background = {0.1, 0.1, 0.1, 0.97}, header = {0.127, 0.127, 0.127, 1},
    widget = {0.15, 0.15, 0.15, 1}, hover = {0.2, 0.2, 0.2, 1},
    border = {0, 0, 0, 1}, accent = {1, 0.27, 0.4, 1},
    text = {0.94, 0.94, 0.94, 1}, muted = {0.7, 0.7, 0.7, 1},
    success = {0.48, 0.93, 0.62, 1},
}

function UI.Color(value)
    return unpack(type(value) == "table" and value or assert(UI.colors[value], "Unknown color"))
end
