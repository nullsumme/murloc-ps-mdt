-- SPDX-License-Identifier: GPL-3.0-only
local Nn, UI = ...

-- This is the only runtime module list. Each module declares its dependencies
-- and exported symbols; bootstrap validates the entire graph before loading it.
UI.manifest = {
    {id = "platform.wow", file = "platform/WoW.lua", requires = {}, exports = {"WoW"}},
    {id = "core.lifecycle", file = "core/Lifecycle.lua", requires = {}, exports = {"Dispose"}},
    {id = "theme.default", file = "theme/Default.lua", requires = {}, exports = {"Color"}},
    {id = "utils.math", file = "utils/Math.lua", requires = {}, exports = {"Clamp"}},
    {id = "primitives.frame", file = "primitives/Frame.lua", requires = {"core.lifecycle", "platform.wow"}, exports = {"Frame"}},
    {id = "layout.pixels", file = "layout/Pixels.lua", requires = {"platform.wow", "core.lifecycle"}, exports = {"Pixel", "Place", "RefreshPixels"}},
    {id = "primitives.text", file = "primitives/Text.lua", requires = {"platform.wow", "theme.default"}, exports = {"Label"}},
    {id = "platform.capabilities", file = "platform/Capabilities.lua", requires = {"primitives.frame", "primitives.text"}, exports = {"Probe"}},
    {id = "primitives.texture", file = "primitives/Texture.lua", requires = {"theme.default"}, exports = {"Fill"}},
    {id = "primitives.border", file = "primitives/Border.lua", requires = {"primitives.texture", "layout.pixels"}, exports = {"Panel"}},
    {id = "primitives.icon", file = "primitives/Icon.lua", requires = {"primitives.frame", "theme.default", "layout.pixels", "platform.capabilities"}, exports = {"Icon"}},
    {id = "widgets.button", file = "widgets/Button.lua", requires = {"primitives.frame", "primitives.border", "primitives.text"}, exports = {"Button"}},
    {id = "widgets.window", file = "widgets/Window.lua", requires = {"widgets.button", "primitives.icon"}, exports = {"Window"}},
    {id = "widgets.checkbox", file = "widgets/Checkbox.lua", requires = {"widgets.button", "primitives.icon"}, exports = {"Checkbox"}},
    {id = "widgets.editbox", file = "widgets/EditBox.lua", requires = {"primitives.frame", "primitives.border", "platform.wow"}, exports = {"EditBox"}},
    {id = "widgets.slider", file = "widgets/Slider.lua", requires = {"primitives.frame", "primitives.border", "utils.math"}, exports = {"Slider"}},
    {id = "widgets.progress", file = "widgets/Progress.lua", requires = {"primitives.frame", "primitives.border", "primitives.text", "utils.math"}, exports = {"Progress"}},
    {id = "widgets.dropdown", file = "widgets/Dropdown.lua", requires = {"widgets.button", "primitives.icon"}, exports = {"Dropdown"}},
    {id = "widgets.scrolllist", file = "widgets/ScrollList.lua", requires = {"widgets.button", "utils.math"}, exports = {"ScrollList"}},
    {id = "widgets.tooltip", file = "widgets/Tooltip.lua", requires = {"primitives.frame", "primitives.border", "primitives.text"}, exports = {"Tooltip"}},
}
