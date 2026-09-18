"""Run with Python + lupa (Lua 5.1). No WoW installation required for mocks."""
from pathlib import Path
from lupa.lua51 import LuaRuntime

root = Path(__file__).resolve().parents[1]
files = list((root / "nilname" / "scripts").rglob("*.lua"))
runtime = LuaRuntime(unpack_returned_tuples=True)
compile_lua = runtime.eval("function(s, name) local f, e = loadstring(s, name); assert(f, e) end")
for path in files:
    source = path.read_text(encoding="utf-8")
    compile_lua(source, str(path))
    assert "Interface\\\\AddOns" not in source
    assert ":SetTexture(" not in source and ":SetAtlas(" not in source
    assert "LibStub(" not in source

for no_lines, no_textures in [(False, False), (True, False), (False, True)]:
    runtime = LuaRuntime(unpack_returned_tuples=True)
    runtime.globals().REPO = root.as_posix()
    runtime.globals().MOCK_NO_LINES = no_lines
    runtime.globals().MOCK_NO_TEXTURES = no_textures
    runtime.execute((root / "tests" / "wow_ui_mock.lua").read_text(encoding="utf-8"))
    print(f"PASS: Lua 5.1 example lifecycle (no_lines={no_lines}, no_textures={no_textures})")
print(f"Validated {len(files)} Lua files; no custom textures, atlases or addon libraries.")
