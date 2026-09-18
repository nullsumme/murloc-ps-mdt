-- SPDX-License-Identifier: GPL-3.0-only
-- Palette and pixel sizing adapted from enderneko/AbstractFramework.
-- See THIRD_PARTY.md for upstream revision and attribution.
local Nn, UI = ...
local unpack = unpack or table.unpack
UI.colors = {
    background = {0.1, 0.1, 0.1, 0.97}, header = {0.127, 0.127, 0.127, 1},
    widget = {0.15, 0.15, 0.15, 1}, hover = {0.2, 0.2, 0.2, 1},
    border = {0, 0, 0, 1}, accent = {1, 0.27, 0.4, 1},
    text = {0.94, 0.94, 0.94, 1}, muted = {0.7, 0.7, 0.7, 1},
    success = {0.48, 0.93, 0.62, 1},
}
UI.frames = {}
UI.disposed = false

function UI.Color(value)
    return unpack(type(value) == "table" and value or assert(UI.colors[value], "Unknown color"))
end

function UI.Clamp(value, lo, hi)
    return math.max(lo, math.min(hi, value))
end

-- AF's 768/physicalHeight conversion, kept local to this library's regions.
function UI.Pixel(region)
    local height = 768
    if type(GetPhysicalScreenSize) == "function" then
        local _, physicalHeight = GetPhysicalScreenSize()
        if physicalHeight and physicalHeight > 0 then height = physicalHeight end
    end
    return (768 / height) / math.max(region:GetEffectiveScale(), 0.01)
end

function UI.Frame(kind, parent)
    assert(not UI.disposed, "Murloc UI instance was disposed")
    local frame = CreateFrame(kind or "Frame", nil, parent or UIParent)
    UI.frames[#UI.frames + 1] = frame
    return frame
end

function UI.Place(frame, parent, x, y, width, height)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, -y)
    frame:SetSize(width, height)
    return frame
end

function UI.Label(parent, text, size, color)
    local label = parent:CreateFontString(nil, "OVERLAY")
    local font, _, flags = GameFontNormal:GetFont()
    label:SetFont(font, size or 12, flags or "")
    label:SetTextColor(UI.Color(color or "text"))
    label:SetJustifyH("LEFT")
    label:SetText(text or "")
    return label
end

function UI.Probe()
    local results = {}
    local function check(name, fn, required)
        local ok, result = pcall(fn)
        results[#results + 1] = {name = name, ok = ok and result ~= false,
            required = required, detail = ok and "call accepted; inspect visually" or tostring(result)}
    end
    local frame
    check("WoW frames", function()
        assert(type(CreateFrame) == "function" and UIParent, "CreateFrame/UIParent missing")
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
