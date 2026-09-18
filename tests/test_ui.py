"""Run with Python + lupa (Lua 5.1). Tests source and packaged install layouts."""
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from package_nilname import build_package

files = list((ROOT / "packages" / "murloc-ui").rglob("*.lua"))
files += list((ROOT / "examples").rglob("*.lua"))
runtime = LuaRuntime(unpack_returned_tuples=True)
compile_lua = runtime.eval("function(s, name) local f, e = loadstring(s, name); assert(f, e) end")
for path in files:
    source = path.read_text(encoding="utf-8")
    compile_lua(source, str(path))
    assert "LibStub(" not in source


def source_script(path):
    mappings = {
        "/scripts/murloc-ui/": ROOT / "packages" / "murloc-ui",
        "/scripts/murloc-ui-lab/": ROOT / "examples" / "ui-lab",
    }
    if path == "/scripts/_murloc_ui_example.lua":
        return str(ROOT / "examples" / "_murloc_ui_example.lua")
    for prefix, directory in mappings.items():
        if path.startswith(prefix):
            return str(directory / path[len(prefix):])
    raise AssertionError(f"Unmapped script {path}")


def check_ui(resolve_script, label):
    for no_lines, no_textures in [(False, False), (True, False), (False, True)]:
        runtime = LuaRuntime(unpack_returned_tuples=True)
        runtime.globals().resolve_script = resolve_script
        runtime.globals().MOCK_NO_LINES = no_lines
        runtime.globals().MOCK_NO_TEXTURES = no_textures
        runtime.execute((ROOT / "tests" / "wow_ui_mock.lua").read_text(encoding="utf-8"))
        print(f"PASS: {label} (no_lines={no_lines}, no_textures={no_textures})")


check_ui(source_script, "source lifecycle")
with TemporaryDirectory(prefix="murloc-ui-package-") as directory:
    temp = Path(directory)
    package = build_package(temp / "example.zip")
    repeat = build_package(temp / "repeat.zip")
    assert package.read_bytes() == repeat.read_bytes(), "Package must be reproducible"
    with ZipFile(package) as archive:
        assert archive.testzip() is None
        archive.extractall(temp / "install")
    check_ui(lambda path: str(temp / "install" / path.lstrip("/")), "packaged lifecycle")
    library = build_package(temp / "library.zip", include_examples=False)
    with ZipFile(library) as archive:
        assert "scripts/murloc-ui/init.lua" in archive.namelist()
        assert not any(name.startswith("scripts/_") or "murloc-ui-lab" in name for name in archive.namelist())

runtime = LuaRuntime(unpack_returned_tuples=True)
runtime.globals().INIT_PATH = str(ROOT / "packages" / "murloc-ui" / "init.lua")
runtime.execute((ROOT / "tests" / "ui_loader.lua").read_text(encoding="utf-8"))
print(f"Validated {len(files)} Lua files, dependency failures and both package layouts.")
