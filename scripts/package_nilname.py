"""Build a reproducible install layout from framework and example sources."""
import argparse
from pathlib import Path
from zipfile import ZipFile, ZipInfo, ZIP_DEFLATED

ROOT = Path(__file__).resolve().parents[1]


def build_package(output: Path, include_examples: bool = True) -> Path:
    source = ROOT / "packages" / "murloc-ui"
    files = {"scripts/murloc-ui/" + path.relative_to(source).as_posix(): path
             for path in source.rglob("*.lua")}
    files.update({name: source / name for name in ("README.md", "LICENSE", "THIRD_PARTY.md")})
    if include_examples:
        lab = ROOT / "examples" / "ui-lab"
        files.update({"scripts/murloc-ui-lab/" + path.relative_to(lab).as_posix(): path
                      for path in lab.rglob("*.lua")})
        files["scripts/_murloc_ui_example.lua"] = ROOT / "examples" / "_murloc_ui_example.lua"
        files["EXAMPLE.md"] = lab / "README.md"
    output = output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(output, "w", ZIP_DEFLATED) as archive:
        for name, path in sorted(files.items()):
            info = ZipInfo(name, (2026, 1, 1, 0, 0, 0))
            info.compress_type = ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, path.read_bytes())
    return output


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--library-only", action="store_true", help="Exclude the auto-start test plugin")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    name = "murloc-ui-library.zip" if args.library_only else "murloc-ui.zip"
    output = args.output or ROOT / "dist" / name
    print(f"Created {build_package(output, not args.library_only)}")
