-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Clamp(value, lo, hi)
    return math.max(lo, math.min(hi, value))
end
