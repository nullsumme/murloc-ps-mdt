# AbstractFramework to NilName: compatibility assessment

Reviewed 2026-09-18. AbstractFramework source revision:
`6b2b2fedd8c27cc85370cb78991d32cb2a1c380f`.

## Conclusion

The available NilName documentation does not establish that images are prohibited.
It documents a Lua script loader and access to WoW APIs, but does not document
an API that registers arbitrary external image bytes with WoW's texture renderer.
Reading a file through NilName is not proof that WoW can render it as a texture.

A Lua-only distribution can still create graphical UI and reference textures,
atlases, icons and fonts already present in the game, provided those WoW UI APIs
are available in the NilName environment. That availability remains an in-game
verification requirement, not a result established by this source review.

Recommended approach: selectively port AbstractFramework's core widgets and
layout code, introduce a NilName loader and lifecycle, and replace packaged media
with native game resources or Lua-created shapes. Do not rewrite the renderer or
port every module before proving a small window works.

## Evidence and required changes

| Area | Source finding | Proposed change |
| --- | --- | --- |
| Script entry | NilName passes `Nn` first and extra `Require` arguments afterwards. AF modules use `select(2, ...)`. | Share a private framework table via `Nn:Require(path, UI)`. The second argument can remain the framework table, preserving many modules' entry code. Audit every module and dependency rather than assuming they all share this convention. |
| Load order | AF uses a `.toc`, XML library includes and client-specific load tags. | Define explicit ordered Lua module lists; select client-specific modules in Lua. Do not assume NilName processes addon TOCs/XML. |
| Initialization | `Init.lua` waits for its own `ADDON_LOADED` and for `FIRST_FRAME_RENDERED`. | Initialize after modules/config are ready. NilName starts scripts in-world; past startup events cannot be relied on. Keep later scale-change handling. |
| Media | `Media/Media.lua` constructs `Interface\\AddOns\\AbstractFramework\\Media\\...` paths for icons, textures, fonts, logos and sounds. | Replace the media provider. Use tested built-in textures/file IDs/atlases, game font objects, and procedural shapes. No external asset files in the core package. |
| Backgrounds | `Widgets/Base.lua` uses the bundled white texture for backdrop fill and edges. | Supply a tested built-in white resource or replace backdrops with a fill and four border textures. |
| Icons | Buttons, edit boxes, dropdowns, scroll controls and more use AF icon names. | Add semantic icon mappings; draw simple close/arrows/check marks with primitives where appropriate. An atlas needs `SetAtlas`, not an unchanged `SetTexture` call. |
| Fonts | `Widgets/Font.lua` already derives its main fonts from game font objects; `Media/SharedMedia.lua` registers custom fonts. | Retain native font defaults; omit custom font registrations. Check locale coverage. |
| XML | `Widgets/Tooltip.lua` instantiates `AFTooltipTemplate`, supplied by AF's XML. | Build a simple Lua tooltip first, or adapt a tested built-in tooltip template. Do not assume deleting the XML leaves the template available. |
| Persistence | The TOC declares `SavedVariables: AFConfig`. | Use an explicit config table and a NilName filesystem/serialization adapter if persistence is wanted. Add defaults, schema versioning, corrupt-file recovery and throttled saves. An external Lua script does not register addon saved variables. |
| Libraries | `.pkgmeta` fetches dependencies missing from a plain source clone; `Init.lua` obtains them eagerly through LibStub. | Audit the transitive dependencies of the selected widgets. Keep only required Lua libraries with an explicit load order; remove eager lookups for omitted features. |
| Isolation | AF exports `_G.AbstractFramework`, named frames/fonts, slash commands and some global mixins. PixelUtil hooks shared region metatables. | Use a distinct framework namespace; prefer unnamed/private objects where possible; apply pixel settings to owned objects. Test coexistence with installed AF and other addons. |
| Client differences | The TOC covers multiple clients and conditional files. | Choose the first supported client/build. Feature-detect APIs, templates, atlas names and mixins; test each supported client separately. |

## Suggested first milestone

1. Run a small capability probe inside the intended NilName/WoW client, with AF
   disabled to avoid accidentally relying on its media, globals or templates.
2. Establish the private namespace, explicit module loader, game API adapter,
   configuration defaults and initialization lifecycle.
3. Port color/pixel/layout helpers and a draggable window containing a label,
   button, checkbox, edit box, slider and scrollable list.
4. Test interaction, scale changes, reload/re-entry and duplicate initialization.
   Add cleanup for event handlers, timers and frames owned by the library.
5. Add dropdowns, tooltips and persistence, then richer widgets as needed.

Defer communication, data-broker/minimap integration, custom glow effects, image
viewer, calendar, game unit/spell utilities and the full demo. Some may later be
useful, but they are not prerequisites for the initial UI library.

## Runtime checks still required

- `CreateFrame`, `UIParent`, `CreateFont`, event registration and callback behavior.
- `CreateTexture` plus `SetColorTexture` for fills and borders.
- A known built-in texture path/file ID, and `SetAtlas` with an atlas present in
  the target client. Verify visible output, not just lack of a Lua error.
- Font strings using the current game's default font, including relevant locales.
- Lines, masks and gradients only when selected widgets need them.
- Built-in tooltip/backdrop template availability and client-specific APIs.
- `Nn:Require` argument propagation, environment/global visibility and load order.
- Late initialization, `/reload`, script re-entry and operation during combat.
  Do not assume protected UI operations become unrestricted through NilName.
- If custom assets are ever needed: separately test game-visible files versus
  external NilName paths. Neither byte reads nor base64 encoding demonstrate
  a supported image-upload path.

No live WoW/NilName runtime test was performed in this assessment.

## Source references

- [NilName script loading](nilname/API/Scripts.md)
- [NilName developer examples](nilname/Home/Getting_started_as_a_developer.md)
- [NilName filesystem API](nilname/API/FileSystem.md)
- [NilName LibDraw page](nilname/LuaAPI/Utils/LibDraw.md): currently only a TODO;
  insufficient evidence for selecting it as a widget renderer.
- [AF initialization](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Init.lua)
- [AF load manifest](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/AbstractFramework.toc)
- [AF media paths](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Media/Media.lua)
- [AF texture implementation](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Texture.lua)
- [AF font implementation](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Font.lua)
- [AF widget base](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Base.lua)
- [AF tooltip XML](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/TooltipTemplate.xml)
- [AF pixel utilities](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/PixelUtil.lua)
- [AF external dependency list](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/.pkgmeta)
- [AF license](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/LICENSE): GPL-3.0; preserve upstream provenance and license when vendoring source, and review dependency licenses before distribution.
