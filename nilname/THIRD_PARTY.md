# AbstractFramework attribution

This Lua UI implementation adapts the palette, pixel conversion approach and
header/body window composition from **AbstractFramework**, by **enderneko**.

- Repository: https://github.com/enderneko/AbstractFramework
- Reviewed revision: `6b2b2fedd8c27cc85370cb78991d32cb2a1c380f`
- Source references: `Widgets/Color.lua`, `Utils/PixelUtil.lua`, `Widgets/Frame.lua`
- License: GNU General Public License, version 3; included as `LICENSE`.

The Murloc adaptation replaces addon startup, shared globals, media files,
templates and library dependencies with explicit NilName loading and procedural
controls. It is not an upstream release and does not claim full AF API parity.
The Lua files in this directory are distributed under GPL-3.0-only. The copied
NilName reference documentation elsewhere in the repository has its own authors
and is not relicensed by this notice.
