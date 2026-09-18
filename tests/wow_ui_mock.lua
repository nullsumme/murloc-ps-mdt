-- Behavioral test double, not evidence of real-client rendering compatibility.
local methods = {}
local objects = {}
local function new(kind, parent)
    local object = setmetatable({kind = kind, parent = parent, scripts = {}, events = {},
        shown = true, enabled = true, width = 100, height = 24, scale = 1, text = ""}, {__index = methods})
    objects[#objects + 1] = object
    return object
end
for _, name in ipairs({"SetPoint", "ClearAllPoints", "SetAllPoints", "SetTextColor", "SetJustifyH",
    "SetWordWrap", "SetSnapToPixelGrid", "SetTexelSnappingBias", "SetFrameStrata", "SetClampedToScreen",
    "SetMovable", "EnableMouse", "RegisterForDrag", "RegisterForClicks", "StartMoving", "StopMovingOrSizing",
    "SetAutoFocus", "SetTextInsets", "SetMaxLetters", "SetOrientation", "SetValueStep", "SetObeyStepOnDrag",
    "EnableMouseWheel", "SetStartPoint", "SetEndPoint", "SetThickness"}) do
    methods[name] = function() end
end
function methods:Fire(name, ...) if self.scripts[name] then self.scripts[name](self, ...) end end
function methods:SetScript(name, fn) self.scripts[name] = fn end
function methods:GetScript(name) return self.scripts[name] end
function methods:HookScript(name, fn)
    local old = self.scripts[name]
    self.scripts[name] = function(...) if old then old(...) end; fn(...) end
end
function methods:HasScript() return true end
function methods:SetSize(w, h) self.width = w; self.height = h; self:Fire("OnSizeChanged", w, h) end
function methods:SetWidth(w) self.width = w end
function methods:SetHeight(h) self.height = h end
function methods:GetSize() return self.width, self.height end
function methods:GetWidth() return self.width end
function methods:GetHeight() return self.height end
function methods:SetScale(s) self.scale = s end
function methods:GetEffectiveScale() return self.scale * (self.parent and self.parent:GetEffectiveScale() or 1) end
function methods:CreateTexture() return new("Texture", self) end
function methods:CreateFontString() return new("FontString", self) end
function methods:CreateLine() if MOCK_NO_LINES then error("No line API") end; return new("Line", self) end
function methods:SetColorTexture(...) if MOCK_NO_TEXTURES then error("No solid textures") end; self.color = {...} end
function methods:SetFont(font, size, flags) self.font = font; self.fontSize = size; self.flags = flags end
function methods:GetFont() return self.font or "Fonts/mock.ttf", self.fontSize or 12, self.flags or "" end
function methods:SetText(text) self.text = text; self:Fire("OnTextChanged", false) end
function methods:GetText() return self.text end
function methods:GetStringHeight() return 28 end
function methods:Show() self.shown = true end
function methods:Hide() local shown = self.shown; self.shown = false; if shown then self:Fire("OnHide") end end
function methods:IsShown() return self.shown end
function methods:Enable() self.enabled = true end
function methods:Disable() self.enabled = false end
function methods:IsEnabled() return self.enabled end
function methods:SetAlpha(alpha) self.alpha = alpha end
function methods:ClearFocus() self.focus = false end
function methods:RegisterEvent(event) self.events[event] = true end
function methods:UnregisterAllEvents() self.events = {} end
function methods:SetMinMaxValues(lo, hi) self.minimum = lo; self.maximum = hi end
function methods:SetValue(value)
    value = math.max(self.minimum, math.min(self.maximum, value))
    if self.value == value then return end
    self.value = value; self:Fire("OnValueChanged", value)
end
function methods:GetValue() return self.value end
function methods:SetThumbTexture(texture) assert(type(texture) == "table"); self.thumb = texture end
function methods:SetScrollChild(child) self.child = child end
function methods:SetVerticalScroll(value) self.offset = value end
UIParent = new("Frame")
GameFontNormal = new("Font")
SlashCmdList = {}
function CreateFrame(kind, name, parent, template)
    assert(name == nil and template == nil, "Library must use unnamed frames without XML templates")
    return new(kind, parent or UIParent)
end
function GetPhysicalScreenSize() return 1920, 1080 end
local logs = {}
print = function(message) logs[#logs + 1] = tostring(message) end
local nn = {}
function nn:Require(path, ...)
    local chunk = assert(loadfile(resolve_script(path)))
    return chunk(self, ...)
end
local function start() nn:Require("/scripts/_murloc_ui_example.lua") end
start()
if MOCK_NO_TEXTURES then
    assert(not MurlocUIExample, "Failed startup must not publish the example")
    assert(logs[#logs]:find("startup failed"))
    for _, object in ipairs(objects) do
        if object.kind == "Frame" and object ~= UIParent then assert(not object.shown) end
    end
    return
end
local app = assert(MurlocUIExample, table.concat(logs, "\n"))
assert(app.ui.loaded and app.ui.nativeLines == not MOCK_NO_LINES)
for _, module in ipairs(app.ui.manifest) do assert(app.ui.loadedModules[module.id]) end
nn:Require('/scripts/murloc-ui/init.lua', app.ui)
local count = #objects
start()
assert(#objects == count, "Entry script must be idempotent")
app.action:Fire("OnClick")
app.checkbox:SetValue(false)
assert(not app.action:IsEnabled())
app.checkbox:SetValue(true)
assert(app.action:IsEnabled())
app.input:SetText("edited")
app.input:Fire("OnTextChanged", true)
app.slider:SetValue(42.7)
assert(app.slider:GetValue() == 43)
app.slider:Fire("OnMouseWheel", -1)
assert(app.slider:GetValue() == 42)
app.dropdown:Fire("OnClick")
assert(app.dropdown.menu:IsShown())
app.dropdown.menu.rows[3]:Fire("OnClick")
assert(app.dropdown.value == 3 and not app.dropdown.menu:IsShown())
app.list:SetOffset(10000)
assert(app.list.offset == 16 * 24 - 152)
app.list:SetOffset(-100)
assert(app.list.offset == 0)
app.list.rows[9]:Fire("OnClick")
assert(app.list.selected == 9)
app.action:Fire("OnEnter")
assert(app.ui.tooltip:IsShown())
app.action:Fire("OnLeave")
assert(not app.ui.tooltip:IsShown())
local before = #objects
for i = 1, 20 do app.ui.RefreshPixels() end
assert(#objects == before, "Redraw must not allocate more regions")
SlashCmdList.MURLOCUIEXAMPLE()
assert(not app.window:IsShown())
SlashCmdList.MURLOCUIEXAMPLE()
assert(app.window:IsShown())
app.ui.Dispose()
app.ui.Dispose()
assert(not MurlocUIExample and not SlashCmdList.MURLOCUIEXAMPLE)
for _, frame in ipairs(app.ui.frames) do
    assert(not frame.shown and next(frame.events) == nil and next(frame.scripts) == nil)
end
