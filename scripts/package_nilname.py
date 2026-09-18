"""Package the Lua-only NilName plugin and its documentation/license."""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED

root = Path(__file__).resolve().parents[1]
source = root / "nilname"
destination = root / "dist" / "murloc-ui.zip"
destination.parent.mkdir(exist_ok=True)
files = sorted((source / "scripts").rglob("*.lua"))
files += [source / name for name in ("README.md", "LICENSE", "THIRD_PARTY.md")]
assert len(files) >= 8 and all(path.is_file() for path in files)
with ZipFile(destination, "w", ZIP_DEFLATED) as archive:
    for path in files:
        archive.write(path, path.relative_to(source).as_posix())
print(f"Created {destination} ({len(files)} files)")
