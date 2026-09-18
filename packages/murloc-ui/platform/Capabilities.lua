-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

function UI.Probe()
    local results = {}
    local function check(name, fn, required)
        local ok, result = pcall(fn)
        results[#results + 1] = {name = name, ok = ok and result ~= false,
            required = required, detail = ok and "call accepted; inspect visually" or tostring(result)}
    end
    local frame
    check("WoW frames", function()
        UI.WoW.CheckFrames()
        frame = UI.Frame("Frame")
        frame:Hide()
    end, true)
    if frame then
        check("Solid textures", function()
            frame:CreateTexture(nil, "ARTWORK"):SetColorTexture(1, 1, 1, 1)
        end, true)
        check("Native game font", function() UI.Label(frame, "Font probe") end, true)
        check("Native line drawing", function()
            local line = frame:CreateLine(nil, "ARTWORK")
            line:SetColorTexture(1, 1, 1, 1)
            line:SetThickness(1)
            line:SetStartPoint("TOPLEFT", frame, 0, 0)
            line:SetEndPoint("BOTTOMRIGHT", frame, 0, 0)
        end, false)
        frame:Hide()
    end
    UI.capabilities = results
    UI.nativeLines = false
    local ready = true
    for _, result in ipairs(results) do
        if result.name == "Native line drawing" then UI.nativeLines = result.ok end
        if result.required and not result.ok then ready = false end
    end
    return ready, results
end
