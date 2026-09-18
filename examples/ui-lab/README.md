# NilName UI laboratory

## Install the example

Run `python scripts/package_nilname.py` from the repository root. Extract
`dist/murloc-ui.zip` and copy its `scripts` contents into the NilName `scripts`
directory. Preserve this structure:

```text
<NilName>/
  scripts/
    _murloc_ui_example.lua
    murloc-ui/
      init.lua
      manifest.lua
      core/
      platform/
      theme/
      layout/
      utils/
      primitives/
      widgets/
    murloc-ui-lab/
      init.lua
      scenes/Overview.lua
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


The reusable framework lives in `packages/murloc-ui/`. This example is packaged
separately and is excluded by `python scripts/package_nilname.py --library-only`.
New feature demonstrations belong in `scenes/`, with one focused scene per feature
family as coverage grows. Only `Overview.lua` exists today.
