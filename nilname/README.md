# Murloc UI for NilName — 0.1.0

A first Lua-only adaptation of AbstractFramework's visual style and frame
composition. Dark panels, thin borders, native game fonts, pink accents, and
procedural icons. No bundled images, custom fonts, XML, LibStub or installed
AbstractFramework addon are required. This is a focused UI subset, not a
drop-in replacement for the entire AbstractFramework API.

## Install the example

Copy the **contents** of this `scripts` directory into the `scripts` directory
beside your NilName executable. Preserve this structure:

```text
<NilName>/
  scripts/
    _murloc_ui_example.lua
    murloc-ui/
      init.lua
      Core.lua
      Draw.lua
      Widgets.lua
```

Enter the game or use `/reload`. NilName auto-loads the underscore-prefixed
example. It prints a capability report and opens the UI laboratory. This is a
NilName script plugin; do not install it as a WoW addon or create a `.toc`.

Use `/murlocui` to hide/show the window. If slash commands are unavailable in
your environment, run `Nn:Require('/scripts/_murloc_ui_example.lua')` from a
NilName script to show the existing window. Re-running reuses the instance;
use `/reload` after editing source files.

The example is entirely interactive UI: it does not move the character, cast
spells, communicate over the network, or write configuration files. Control
values reset on `/reload`. Filesystem-backed settings are not included yet.

## Test in the actual client

Disable the installed AbstractFramework addon for the initial test so it cannot
supply dependencies accidentally. Then:

1. Read the chat capability report. Missing frames, solid textures or native
   fonts abort startup with an error. Missing line drawing selects a bounded
   pixel-stroke fallback. An accepted API call is not proof of visible output.
2. Confirm the dark panel, borders, text, and all seven icon samples render.
3. Drag the title bar; close/reopen with `/murlocui`.
4. Click the action button and inspect the status count. Toggle the checkbox;
   the disabled button must stop accepting clicks.
5. Edit the label; confirm the preview changes. Enter/Escape releases focus.
6. Drag or mouse-wheel the progress slider and check the progress bar.
7. Open the dropdown and select each option. Click the dropdown again to close
   without selecting. Only one dropdown can be open per UI instance.
8. Scroll the list to both ends and select a row; inspect the status message.
9. Hover the action button to inspect the Lua tooltip.
10. Apply UI scale at 75%, 100%, 125%; change the game's UI scale and inspect
    borders. Re-run the entry script and verify it does not create a second UI.
11. Check these ordinary UI interactions during combat and after `/reload`.

Report client flavor/build, NilName version, capability output, Lua errors and
any visual defects. No WoW client flavor is certified yet: the automated tests
use a mock API, not a running WoW/NilName client. Pixel-stroke fallback icons
may look less smooth than native lines.

## Use the library in another NilName script

```lua
local Nn = ...
local UI = {}
Nn:Require('/scripts/murloc-ui/init.lua', UI)
local ready, capabilities = UI.Probe()
assert(ready, 'Required WoW UI capability missing')
local window = UI.Window('My plugin', 400, 260)
local button = UI.Button(window.body, 'Hello', 120, function()
    print('Hello from NilName')
end)
button:SetPoint('TOPLEFT', 0, 0)
window:Show()
```

Exports are passed in the caller-owned table; the loader does not depend on a
return value from `Nn:Require`. Call `UI.Probe()` before constructing widgets.
The library does not publish an AF global or hook shared WoW metatables.
The example alone uses `_G.MurlocUIExample` as a reload guard and registers its
own slash command. It never expects NilName APIs to exist in `_G`.

| Function | Result / callback |
| --- | --- |
| `Window(title, width, height)` | Draggable frame with `.body` content area |
| `Label(parent, text, size?, color?)` | Native font string |
| `Button(parent, text, width?, onClick?)` | Button; `SetActive(enabled)` |
| `Checkbox(parent, text, checked, onChange?)` | `SetValue(checked, silent?)`; callback receives boolean |
| `EditBox(parent, width, text, onChange?)` | Callback receives user-edited text |
| `Slider(parent, width, min, max, step, value, onChange?)` | Native slider; callback receives snapped value |
| `Progress(parent, width, height)` | `SetValue(fraction)` with range 0–1 |
| `Dropdown(parent, width, items, selectedIndex, onChange?)` | 1–12 string items; callback receives index/text |
| `ScrollList(parent, width, height, items, onSelect?)` | Fixed-size list; wheel scrolling; callback receives index/text |
| `Icon(parent, name, size?, color?)` | close/check/down/up/plus/minus/resize; `SetColor(color)` |
| `Tooltip(target, text)` | Lua-created hover tooltip |
| `RefreshPixels()` | Refresh owned borders/icons after scale changes |
| `Dispose()` | Hide owned frames, detach handlers/events and clean up the example registration |

Colors accept a named palette entry or `{r, g, b, a}`. Anchors and dimensions
use normal WoW frame APIs. Fixed-size lists allocate all rows, so use them for
small settings lists, not thousands of records. Dropdowns do not yet dismiss
on an outside click. The library uses no timers or per-frame update loop.

## Tests and package

From the repository root:

```text
python -m pip install -r tests/requirements-ui.txt
python tests/test_ui.py
python scripts/package_nilname.py
```

The Lua 5.1 tests cover both render paths, missing-capability failure, slider
snapping, dropdown selection, scrolling limits, enable/disable, repeated entry,
allocation-free redraw and disposal. They cannot validate visuals or WoW API
availability. Packaging writes `dist/murloc-ui.zip` with scripts and attribution.

See `THIRD_PARTY.md` and `LICENSE` for the GPL-3.0 source attribution.
