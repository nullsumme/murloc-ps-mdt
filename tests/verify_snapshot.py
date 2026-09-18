"""Verify snapshot coverage, hashes and Markdown-only storage (Python stdlib)."""
import hashlib
import json
from pathlib import Path


root = Path(__file__).resolve().parents[1] / "docs" / "nilname"
manifest = json.loads((root / "manifest.json").read_text(encoding="utf-8"))
assert manifest["complete"] and not manifest["failures"] and not manifest["pending"]
assert len(manifest["pages"]) == manifest["discovered"]
assert len({page["path"] for page in manifest["pages"]}) == manifest["discovered"]
assert not list(root.rglob("*.html")), "Documentation must be Markdown only"
for page in manifest["pages"]:
    markdown = (root / (page["path"] + ".md")).read_bytes()
    assert hashlib.sha256(markdown).hexdigest() == page["sha256"], page["url"]
    assert markdown.decode("utf-8").startswith("<!-- Source: " + page["url"] + " -->")
print(f"Verified {manifest['discovered']} Markdown pages and their hashes.")
