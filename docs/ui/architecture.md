# Murloc UI architecture and AbstractFramework parity

## Decisions

- Full AbstractFramework feature coverage is the target, not a demo-sized subset.
- Preserve AF public names, argument order, return objects, callbacks and mixin
  methods where practical. Explain adaptations explicitly; no silent no-op shims.
- Retail is the first supported-client target. Other clients are a later
  compatibility effort, not something inferred from a shared Lua API.
- Runtime distribution contains Lua only. Render simple visual elements
  procedurally; built-in game resources may be used through a media provider
  where appropriate. Do not ship custom image/font/XML files.
- The framework is a reusable package independent of the MDT application and
  the UI laboratory. Loading the package must not open example windows.
- Source inspection and mock tests never count as live-client verification.

## Repository structure

```text
packages/
  murloc-ui/                   reusable, licensed runtime package
    init.lua                   stable NilName entry; load validation
    manifest.lua               explicit dependency graph and export contracts
    core/                      lifecycle and resource ownership
    platform/                  WoW API boundary and capability checks
    theme/                     colors and visual defaults
    layout/                    pixel sizing, positioning; future layout engines
    utils/                     math; future general-purpose utilities
    primitives/                frames, text, fills, borders and procedural icons
    widgets/                   one widget implementation per module
    README.md
    LICENSE
    THIRD_PARTY.md
examples/
  _murloc_ui_example.lua        thin NilName auto-start entry
  ui-lab/
    init.lua                   example lifecycle and slash command
    scenes/Overview.lua        current interactive control gallery
    README.md                  installation and manual test procedure
docs/
  nilname/                     scraped upstream NilName docs
  ui/
    architecture.md            design and compatibility policy
    coverage/
      upstream.json            pinned, generated source inventory
      inventory.md             human-readable declarations and asset inventory
      status.json              source-to-module implementation/verification map
      features.md              feature matrix and ordered work plan
scripts/
  package_nilname.py           source-to-install mapping, reproducible ZIPs
  inventory_abstractframework.py
tests/
  test_ui.py                   Lua 5.1 source and packaged runtime tests
  ui_loader.lua               manifest dependency/error handling tests
  wow_ui_mock.lua              explicit WoW test double and interactions
  verify_ui_coverage.py        inventory/status/source consistency checks
dist/                         generated, untracked installation artifacts
```

The source layout is not the installation layout. The packager maps
`packages/murloc-ui/` to `/scripts/murloc-ui/` and `examples/ui-lab/` to
`/scripts/murloc-ui-lab/`. This keeps downstream plugin entry paths stable as
repository organization changes.

Keep a single source copy. The old `nilname/scripts` tree is removed, rather
than maintaining a second runtime tree that can drift. Its README is a migration
pointer only. Empty directories and placeholder implementations are not used to
represent planned features.

## Planned module families

Add these directories when their first real implementation and tests land:

| Directory inside murloc-ui | Responsibility |
| --- | --- |
| `compat/` | AF public API adapters and documented differences; no blanket `_G.AbstractFramework` assignment |
| `data/` | Object pools, queues and shared data structures |
| `core/executors/` | Timed/update/item work with cancellation and owned cleanup |
| `locales/` | Language dictionaries and fallback behavior |
| `media/` | Semantic resource catalog, procedural/built-in providers, glyph helpers |
| `integrations/` | Optional communication, data broker, minimap and shared-media adapters |
| `game/units/`, `game/spells/` | Retail gameplay data/helpers; not prerequisites for rendering a button |
| `vendor/` | Only required, audited Lua dependencies with pinned versions and notices |

Add services such as events, callbacks, settings and scheduling as focused files
under `core/`; do not rebuild another large `Core.lua`. Split a widget into a
subdirectory only when its variants/state/layout are substantial enough to need
multiple files. Likewise, grow `tests/` into `unit/`, `contracts/`, `integration/`
and `fixtures/` when tests actually exist for those scopes.

## Dependency direction

```text
NilName bootstrap + platform capabilities
                ↓
core / data / utils / theme
                ↓
layout + rendering primitives + media providers
                ↓
widgets and composed controls
                ↓
AF compatibility layer
                ↓
UI laboratory and application plugins
```

Optional integrations and game-data modules depend on core services. Generic
widgets must not import MDT data, the lab, communication, or spell databases.
Reusable code belongs in the framework; demonstration state belongs in a scene.

`manifest.lua` records dependencies by module ID, source file and exports. The
loader validates unknown dependencies, cycles, duplicate IDs/files/exports and
unsafe paths before loading any module. It checks exports after loading. It
loads into the caller-owned table via documented `Nn:Require(path, UI)` semantics,
without depending on a return value. Re-initialization of a loaded table is a
no-op; failed/disposed instances require a fresh table. A failure must not be
mistaken for a loaded framework.

The initial manifest loads the current implemented subset. Full/optional module
profiles can be introduced once those real modules exist; absent features must
not be represented by empty stubs. The public entry remains `init.lua`.

## AF compatibility policy

The upstream baseline is revision
`6b2b2fedd8c27cc85370cb78991d32cb2a1c380f`. Update it deliberately and review
inventory changes. A similarly named Murloc control is not an AF-compatible
control. In particular `UI.Button(...)` must not simply become
`AF.CreateButton(...)` without comparing defaults, argument semantics, event
callbacks, widget methods and state behavior.

For each upstream constructor/export:

1. Capture its signature and the returned object's relevant mixins/methods.
2. Identify helpers, callbacks, assets and other modules it needs.
3. Port or adapt the implementation with the same observable contract.
4. Write contract tests for upstream calling patterns and edge cases.
5. Add a focused lab scene showing enabled/disabled/hover/selected/focus states.
6. Record API differences, capability limitations and verified Retail build.

Keep the existing short Murloc API working during migration. Introduce compatible
AF names as contracts become real. Do not overwrite an installed AF instance,
depend on its media, or modify global WoW region metatables. Private namespaces,
unnamed frames and owned callbacks keep different plugins isolated.

## What full coverage includes

- Frame variants, text/font helpers, buttons and checkable variants, edit boxes,
  sliders/status bars, scrolling, menus/dropdowns and all widget mixin behavior.
- Animation/glow, movers, color picker, dialogs, popup management, calendar,
  sheets, help tips, sorting by dragging, time-format controls and statistics.
- Media/glyph helpers, fonts, icon/texture catalogs, image viewer and image pane.
- Localization, callbacks/events/hooks, scheduling, pools, queues, math, string,
  table, date/time, color/curve, serialization and asynchronous helpers.
- Optional communications, shared-media/broker/minimap behavior and their library
  dependencies, plus Retail unit/spell helper families.

All inventoried modules remain in the coverage map even if adaptation is hard.
The pinned TOC includes disabled/conditional entries and external package paths;
the inventory retains those distinctions rather than equating file existence
with shipped support. External library internals and dynamically generated API
surfaces require additional audits; the static inventory is a baseline, not a
claim that every runtime method has already been identified.

## Visual parity and media limitations

Preserve geometry, spacing, font metrics, color, layer order and interaction
states before polishing complex shapes. Share named theme tokens and semantic
icon definitions across widgets. Cache geometry, reuse objects and redraw only
when input/theme/size/scale changes; no per-frame allocation for static controls.

The 278 inventoried media assets need a replacement decision individually.
Procedural shapes are suitable for control chrome and simple icons. Detailed
logos, photographs and arbitrary user images cannot be promised as identical
Lua drawings. Image viewer/pane interaction (zoom/pan/crop) and the availability
of an image source are separate capabilities. Unsupported source types need an
explicit error/description, not a blank image reported as successful rendering.

Provide draw implementations that respect the supported source semantics;
texture paths, file IDs, atlases and procedural groups are different types.
Never pass an atlas name or drawing object blindly into an API expecting a file
path. Do not require NilName's undocumented image-byte upload behavior.

## Completion and verification

`status.json` currently marks existing related prototypes as **partial** and
unimplemented modules as **planned**. No source family is verified for AF API,
visual or Retail parity. Each of those dimensions advances independently and
must have evidence; a function-count percentage would hide missing behavior.

A source family reaches completion only when all applicable exports/mixins,
asset substitutions and dependencies have been audited, contract/behavior tests
pass, an example scene exists, and Retail results are recorded. Unsupported
features remain visible with the reason and affected client/source type.

Test both source and generated packages; missing module files can otherwise be
hidden by repository-relative test imports. Use fresh instances for test
isolation, plus repeated-init/disposal tests. Exercise focus, keyboard/mouse,
scroll bounds, scale changes, parent visibility, dropdown dismissal and combat
restrictions in the real client. Track object counts and frame-time costs for
large lists and animated widgets.

The current mocks verify Lua behavior and packaging, not graphical appearance,
security restrictions or host availability. Record screenshots and client build
when in-game testing is available. No framework feature is allowed to assume
NilName removes WoW's protected-frame constraints.
