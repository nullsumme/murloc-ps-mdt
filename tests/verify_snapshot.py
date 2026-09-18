"""Verify snapshot coverage, hashes and verbatim code blocks (Python stdlib)."""
import hashlib
import json
from html.parser import HTMLParser
from pathlib import Path


class CodeBlocks(HTMLParser):
    def __init__(self):
        super().__init__()
        self.in_pre = False
        self.blocks = []

    def handle_starttag(self, tag, attrs):
        if tag == "pre":
            self.in_pre = True
            self.blocks.append("")

    def handle_endtag(self, tag):
        if tag == "pre":
            self.in_pre = False

    def handle_data(self, data):
        if self.in_pre:
            self.blocks[-1] += data


root = Path(__file__).resolve().parents[1] / "docs" / "nilname"
manifest = json.loads((root / "manifest.json").read_text(encoding="utf-8"))
assert manifest["complete"] and not manifest["failures"] and not manifest["pending"]
assert len(manifest["pages"]) == manifest["discovered"]
assert len({page["path"] for page in manifest["pages"]}) == manifest["discovered"]
count = 0
for page in manifest["pages"]:
    markdown = (root / (page["path"] + ".md")).read_bytes()
    assert hashlib.sha256(markdown).hexdigest() == page["sha256"], page["url"]
    html = (root / (page["path"] + ".html")).read_text(encoding="utf-8")
    assert "<article" in html
    parser = CodeBlocks()
    parser.feed(html)
    for block in parser.blocks:
        assert block.rstrip("\n") in markdown.decode("utf-8"), page["url"]
        count += 1
print(f"Verified {manifest['discovered']} pages and {count} verbatim code blocks.")
