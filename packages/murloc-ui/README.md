# Murloc UI for NilName — 0.2.0

A first Lua-only adaptation of AbstractFramework's visual style and frame
composition. Dark panels, thin borders, native game fonts, pink accents, and
procedural icons. No bundled images, custom fonts, XML, LibStub or installed
AbstractFramework addon are required. This is a focused UI subset, not a
drop-in replacement for the entire AbstractFramework API.

## Package and install

From the repository root, run `python scripts/package_nilname.py`. Extract
`dist/murloc-ui.zip` and copy its `scripts` contents into NilName's `scripts`
folder. The included example opens after entering the game or `/reload`.
Use `/murlocui` to toggle it. See the repository's `examples/ui-lab/README.md`
(or `EXAMPLE.md` in the ZIP) for the complete in-game checklist.

For a reusable library without an auto-start demo, run
`python scripts/package_nilname.py --library-only`; install the contents of
`dist/murloc-ui-library.zip` instead. Both packages preserve the public entry path
`/scripts/murloc-ui/init.lua`.

Source code now lives in `packages/murloc-ui/`, organized by responsibility.
Do not copy repository folders wholesale: the packager creates the install paths.
The source `manifest.lua` declares each module's load dependencies and exports.
See `docs/ui/architecture.md` and `docs/ui/coverage/features.md` in the repository
for the structure and full AbstractFramework parity target.

Retail is the first target. Classic support is not claimed. No live-client build
has been verified yet. The existing short API below remains available; matching
AF constructors and mixin contracts will be ported and verified individually.

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

The Lua 5.1 tests run against source files and extracted ZIPs, check the dependency
graph, and cover both render paths, missing-capability failure, slider
snapping, dropdown selection, scrolling limits, enable/disable, repeated entry,
allocation-free redraw and disposal. They cannot validate visuals or WoW API
availability. Packaging writes `dist/murloc-ui.zip` with scripts and attribution.

See `THIRD_PARTY.md` and `LICENSE` for the GPL-3.0 source attribution.
