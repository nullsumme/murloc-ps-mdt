# Feature coverage

Baseline: `6b2b2fedd8c27cc85370cb78991d32cb2a1c380f`. Target: **Retail first, preserve AF API where practical**.

**Full parity is not implemented.** Partial means a related prototype exists; it does not mean an AF constructor or mixin is compatible. All API/runtime/visual checks remain unverified.

The [source inventory](inventory.md) lists individual function signatures, mixin methods, assignments, TOC entries, assets and external dependency declarations. [status.json](status.json) maps every inventoried source to a destination and implementation phase.

| Upstream source | State | Destination under packages/murloc-ui (unless noted) | Phase |
| --- | --- | --- | --- |
| `.unused/Atlas.lua` | planned | `review/` | 6 |
| `.unused/Aura.lua` | planned | `review/` | 6 |
| `.unused/ItemLoadExecutorTest.lua` | planned | `review/` | 6 |
| `Data/ObjectPool.lua` | planned | `data/` | 1 |
| `Data/Queue.lua` | planned | `data/` | 1 |
| `Demo.lua` | partial | `examples/ui-lab/scenes/` | 2 |
| `Executors/ItemLoadExecutor.lua` | planned | `core/executors/` | 1 |
| `Executors/OnUpdateExecutor.lua` | planned | `core/executors/` | 1 |
| `Init.lua` | partial | `core/` | 1 |
| `Libs/FAIAP.lua` | planned | `vendor/` | 5 |
| `Libs/base64.lua` | planned | `vendor/` | 5 |
| `Libs/json.lua` | planned | `vendor/` | 5 |
| `Libs/md5.lua` | planned | `vendor/` | 5 |
| `Libs/qrcode.lua` | planned | `vendor/` | 5 |
| `Libs/sha256.lua` | planned | `vendor/` | 5 |
| `Libs/utf8.lua` | planned | `vendor/` | 5 |
| `Locales/Post.lua` | planned | `locales/` | 2 |
| `Locales/deDE.lua` | planned | `locales/` | 2 |
| `Locales/enUS.lua` | planned | `locales/` | 2 |
| `Locales/esES.lua` | planned | `locales/` | 2 |
| `Locales/esMX.lua` | planned | `locales/` | 2 |
| `Locales/frFR.lua` | planned | `locales/` | 2 |
| `Locales/itIT.lua` | planned | `locales/` | 2 |
| `Locales/koKR.lua` | planned | `locales/` | 2 |
| `Locales/ptBR.lua` | planned | `locales/` | 2 |
| `Locales/ruRU.lua` | planned | `locales/` | 2 |
| `Locales/zhCN.lua` | planned | `locales/` | 2 |
| `Locales/zhTW.lua` | planned | `locales/` | 2 |
| `Media/Glyphs.lua` | planned | `media/` | 4 |
| `Media/Media.lua` | planned | `media/` | 4 |
| `Media/SharedMedia.lua` | planned | `media/` | 4 |
| `Spells/Bleeds.lua` | planned | `game/spells/` | 5 |
| `Spells/Common.lua` | planned | `game/spells/` | 5 |
| `Spells/CrowdControls.lua` | planned | `game/spells/` | 5 |
| `Spells/Dispellables.lua` | planned | `game/spells/` | 5 |
| `Spells/Dispellables_Mists.lua` | planned | `game/spells/` | 5 |
| `Spells/Interrupts.lua` | planned | `game/spells/` | 5 |
| `System/Addon.lua` | planned | `core/` | 1 |
| `System/CallbackHandler.lua` | planned | `core/` | 1 |
| `System/Communication.lua` | planned | `integrations/` | 5 |
| `System/EventHandler.lua` | planned | `core/` | 1 |
| `System/Events.lua` | planned | `core/` | 1 |
| `System/Hooks.lua` | planned | `core/` | 1 |
| `System/Scripts.lua` | planned | `core/` | 1 |
| `Units/Class.lua` | planned | `game/units/` | 5 |
| `Units/Common.lua` | planned | `game/units/` | 5 |
| `Units/ItemLevel.lua` | planned | `game/units/` | 5 |
| `Units/Player.lua` | planned | `game/units/` | 5 |
| `Units/RangeCheck.lua` | planned | `game/units/` | 5 |
| `Units/StatusTimer.lua` | planned | `game/units/` | 5 |
| `Utils/AsyncLoaders.lua` | planned | `utils/` | 1 |
| `Utils/Color.lua` | planned | `utils/` | 1 |
| `Utils/Curve.lua` | planned | `utils/` | 1 |
| `Utils/DateTime.lua` | planned | `utils/` | 1 |
| `Utils/Delay.lua` | planned | `utils/` | 1 |
| `Utils/Math.lua` | partial | `utils/` | 1 |
| `Utils/PixelUtil.lua` | partial | `layout/` | 1 |
| `Utils/Serialization.lua` | planned | `utils/` | 1 |
| `Utils/String.lua` | planned | `utils/` | 1 |
| `Utils/Table.lua` | planned | `utils/` | 1 |
| `Widgets/Animation.lua` | planned | `widgets/Animation.lua` | 3 |
| `Widgets/Base.lua` | partial | `widgets/Base.lua` | 2 |
| `Widgets/Button.lua` | partial | `widgets/Button.lua` | 2 |
| `Widgets/Calendar.lua` | planned | `widgets/Calendar.lua` | 3 |
| `Widgets/CascadingMenu.lua` | planned | `widgets/CascadingMenu.lua` | 3 |
| `Widgets/Color.lua` | partial | `widgets/Color.lua` | 2 |
| `Widgets/ColorPicker.lua` | planned | `widgets/ColorPicker.lua` | 3 |
| `Widgets/DataBroker.lua` | planned | `integrations/DataBroker.lua` | 5 |
| `Widgets/Dialog.lua` | planned | `widgets/Dialog.lua` | 3 |
| `Widgets/DragSorter.lua` | planned | `widgets/DragSorter.lua` | 3 |
| `Widgets/Dropdown.lua` | partial | `widgets/Dropdown.lua` | 2 |
| `Widgets/EditBox.lua` | partial | `widgets/EditBox.lua` | 2 |
| `Widgets/Font.lua` | partial | `widgets/Font.lua` | 2 |
| `Widgets/FontString.lua` | partial | `widgets/FontString.lua` | 2 |
| `Widgets/Frame.lua` | partial | `widgets/Frame.lua` | 2 |
| `Widgets/Glow.lua` | planned | `widgets/Glow.lua` | 3 |
| `Widgets/HelpTip.lua` | planned | `widgets/HelpTip.lua` | 3 |
| `Widgets/ImagePane.lua` | planned | `widgets/ImagePane.lua` | 4 |
| `Widgets/ImageViewer.lua` | planned | `widgets/ImageViewer.lua` | 4 |
| `Widgets/Misc.lua` | planned | `widgets/Misc.lua` | 3 |
| `Widgets/Mover.lua` | planned | `widgets/Mover.lua` | 3 |
| `Widgets/Popup.lua` | planned | `widgets/Popup.lua` | 3 |
| `Widgets/Scroll.lua` | partial | `widgets/Scroll.lua` | 2 |
| `Widgets/Sheet.lua` | planned | `widgets/Sheet.lua` | 3 |
| `Widgets/Slider.lua` | partial | `widgets/Slider.lua` | 2 |
| `Widgets/SmoothStatusBarMixin.lua` | planned | `widgets/SmoothStatusBarMixin.lua` | 3 |
| `Widgets/StatusBar.lua` | partial | `widgets/StatusBar.lua` | 2 |
| `Widgets/Texture.lua` | partial | `widgets/Texture.lua` | 2 |
| `Widgets/TimeFormat.lua` | planned | `widgets/TimeFormat.lua` | 3 |
| `Widgets/Tooltip.lua` | partial | `widgets/Tooltip.lua` | 2 |
| `Widgets/TooltipTemplate.xml` | planned | `widgets/Tooltip.lua` | 2 |
| `Widgets/TooltipTemplate_Classic.xml` | planned | `widgets/Tooltip.lua` | 2 |

## External dependencies and disabled sources

External TOC entries are tracked in `status.json` and `upstream.json`. Their internals are not vendored or audited yet. Disabled TOC entries are retained in the inventory; they do not become supported features merely because upstream has commented-out paths.

## Phases

1. Lifecycle, namespaces, AF compatibility contracts, events/callbacks, pools/queues, utility and scheduling foundations.
2. All frame, font, button, input, slider, status bar, scrolling, dropdown and tooltip variants; localization and widget mixin methods.
3. Animation, glow, movers, cascading menus, color picker, dialogs/popups, calendar, sheets, help tips, drag sorting, time-format controls and statistics panes.
4. Every media/glyph helper, asset mapping, image pane/viewer interaction; explicit limitations for custom external image bytes.
5. Serialization/compression, communication, broker/minimap, shared-media compatibility and Retail unit/spell utilities; audit retained library dependencies.
6. Final cross-feature regressions, client testing, performance checks and review of inactive upstream sources.

Phases order the work; they do not remove features from the target. A feature advances to verified only with linked API-contract tests, behavior tests, an example scene and recorded Retail build/visual results. See [architecture](../architecture.md).
