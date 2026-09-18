"""Check that the pinned AF inventory has no untracked source families."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
directory = ROOT / "docs" / "ui" / "coverage"
upstream = json.loads((directory / "upstream.json").read_text(encoding="utf-8"))
status = json.loads((directory / "status.json").read_text(encoding="utf-8"))
assert status["upstream_revision"] == upstream["revision"], "Coverage baseline is stale"
sources = {module["path"] for module in upstream["modules"]}
tracked = [entry["source"] for entry in status["sources"]]
assert len(tracked) == len(set(tracked)), "Duplicate coverage entry"
assert set(tracked) == sources, "A source was added or removed without a coverage decision"
assert status["target_client"] == "Retail"
for entry in status["sources"]:
    assert entry["destination"] and entry["note"] and 1 <= entry["phase"] <= 6
    assert entry["status"] in {"planned", "partial", "verified", "unsupported"}
    for path in entry["current_files"]:
        assert (ROOT / path).is_file(), f"Stale implementation path: {path}"
    if entry["status"] == "verified":
        assert entry.get("evidence"), "Verified features must link evidence"
    if entry["status"] == "unsupported":
        assert entry.get("reason"), "Unsupported features must explain the limitation"
assert status["external_toc_entries"] == [entry for entry in upstream["toc_entries"] if not entry["present"]]
print(f"Verified coverage records for all {len(sources)} inventoried sources.")
