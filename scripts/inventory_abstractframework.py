"""Inventory a local AF checkout without executing its Lua or fetching dependencies.

Records every tracked Lua/XML source, TOC membership (including disabled entries),
AF exports, mixin declarations, media assets and external dependency declarations.
Static candidates are an audit baseline, not proof of public API completeness.
"""
import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DESTINATION = ROOT / "docs" / "ui" / "coverage"


def git(source, *args):
    return subprocess.check_output(
        ["git", "-c", f"safe.directory={source.as_posix()}", "-C", str(source), *args],
        encoding="utf-8")


def scan(source):
    revision = git(source, "rev-parse", "HEAD").strip()
    assert not git(source, "status", "--porcelain").strip(), "Use an unmodified upstream checkout"
    paths = git(source, "ls-files").splitlines()
    toc = (source / "AbstractFramework.toc").read_text(encoding="utf-8-sig")
    entries = []
    for line in toc.splitlines():
        match = re.match(r"\s*(#\s*)?([^#\s]+\.(?:lua|xml))(?:\s+\[(.*)\])?\s*$", line)
        if match:
            entries.append({"path": match[2].replace("\\", "/"), "enabled": not bool(match[1]),
                            "condition": match[3], "present": (source / match[2].replace("\\", "/")).is_file()})
    toc_paths = {entry["path"]: entry for entry in entries}
    modules, assets = [], []
    for path in paths:
        file = source / path
        if file.suffix.lower() not in (".lua", ".xml"):
            if path.startswith("Media/"):
                assets.append({"path": path, "bytes": file.stat().st_size})
            continue
        text = file.read_text(encoding="utf-8-sig")
        # Keep line numbers stable while omitting long and single-line comments.
        clean = re.sub(r"--\[(=*)\[.*?\]\1\]", lambda m: "\n" * m[0].count("\n"), text, flags=re.S)
        functions, assignments = [], []
        for line_number, line in enumerate(clean.splitlines(), 1):
            if line.lstrip().startswith("--"):
                continue
            match = re.match(r"\s*function\s+((?:AF\.|AF_)[\w.:]+)\s*\(([^)]*)\)", line)
            if match:
                functions.append({"name": match[1], "arguments": match[2], "line": line_number})
            match = re.match(r"\s*(AF\.[A-Za-z_]\w*)\s*=\s*(.*)", line)
            if match:
                assignments.append({"name": match[1], "line": line_number,
                                    "kind": "function" if re.match(r"function\s*\(", match[2]) else "value-or-alias"})
        entry = toc_paths.get(path)
        module = {"path": path, "sha256": hashlib.sha256(file.read_bytes()).hexdigest(),
                  "toc": entry, "functions": functions, "assignments": assignments}
        modules.append(module)
    return {"repository": "https://github.com/enderneko/AbstractFramework", "revision": revision,
            "scope": "Tracked Lua/XML sources, TOC entries, Media assets and .pkgmeta. Includes non-loaded sources; external dependency internals are not fetched.",
            "limitations": "Static declarations/assignments are candidates. Dynamic exports, mixin inheritance, callback contracts and external library APIs still need behavioral audits.",
            "toc_entries": entries, "modules": modules, "assets": assets,
            "external_dependencies": (source / ".pkgmeta").read_text(encoding="utf-8")}


def render(data):
    modules = data["modules"]
    declarations = sum(len(module["functions"]) for module in modules)
    lines = ["# AbstractFramework source inventory", "", f"Pinned revision: `{data['revision']}`.", "",
             f"{len(modules)} tracked Lua/XML files; {len(data['toc_entries'])} TOC entries; "
             f"{declarations} AF/mixin function declarations; {len(data['assets'])} media assets.", "",
             "This is an inventory, **not implemented coverage**. See [the feature matrix](features.md).", "",
             data["limitations"], "", "## TOC and dependencies", "",
             "| Source | Enabled | Client condition | In checkout |", "| --- | --- | --- | --- |"]
    for entry in data["toc_entries"]:
        lines.append(f"| `{entry['path']}` | {'yes' if entry['enabled'] else 'no'} | {entry['condition'] or 'all'} | {'yes' if entry['present'] else 'external / absent'} |")
    lines += ["", "## Source declarations", "",
              "AF exports, named AF mixin methods and direct assignments are listed. Private helpers are omitted.", ""]
    for module in modules:
        path = module["path"]
        link = f"{data['repository']}/blob/{data['revision']}/{path}"
        lines += [f"### [{path}]({link})", ""]
        lines.append("TOC: " + ("enabled" if module["toc"] and module["toc"]["enabled"] else "disabled or not directly listed") + ".")
        lines.append("")
        for function in module["functions"]:
            lines.append(f"- `{function['name']}({function['arguments']})` — line {function['line']}")
        assigned = sorted({item["name"] for item in module["assignments"]})
        if assigned:
            lines += ["", "Assigned exports/fields: " + ", ".join(f"`{name}`" for name in assigned) + "."]
        if not module["functions"] and not assigned:
            lines.append("Data, internal helpers, templates or declarations without a direct AF export.")
        lines.append("")
    lines += ["## Media assets", "", "Each upstream asset requires a procedural/native replacement decision; an inventory entry does not imply image-loading support.", ""]
    lines += [f"- `{asset['path']}` ({asset['bytes']} bytes)" for asset in data["assets"]]
    lines += ["", "## External dependencies", "", "Upstream packaging metadata (dependencies require their own API/license audit):", "", "```yaml", data["external_dependencies"].rstrip(), "```", ""]
    return "\n".join(lines)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkout", type=Path)
    args = parser.parse_args()
    data = scan(args.checkout.resolve())
    DESTINATION.mkdir(parents=True, exist_ok=True)
    (DESTINATION / "upstream.json").write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")
    (DESTINATION / "inventory.md").write_text(render(data), encoding="utf-8", newline="\n")
    print(f"Recorded {len(data['modules'])} sources and {len(data['assets'])} assets at {data['revision']}")
