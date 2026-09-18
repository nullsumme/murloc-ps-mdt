# Murloc MDT

The [Lua-only NilName UI library and example plugin](nilname/README.md) live in
`nilname/scripts/`. Copy that directory's contents into NilName's `scripts/`
folder, then enter the game or `/reload`. Use `/murlocui` to toggle the example.
The implementation uses procedural controls inspired by AbstractFramework;
live-client compatibility and rendering still need in-game testing.

Documentation reference snapshot from [Nil-Name Docs](https://docs.nilname.com/).
Browse the [downloaded documentation](docs/nilname/README.md).

## Using the docs in future agent sessions

Start at [the documentation index](docs/nilname/README.md), then read the linked
Markdown files directly. Search locally with `rg -n "GeneratePath" docs/nilname -g '*.md'`.
Each page records its original source URL. `AGENTS.md` points future agents to
this snapshot automatically. Reading the saved docs needs no browser or network.
Pages use named files within topic folders, for example
`docs/nilname/LuaAPI/Movement/GeneratePath.md`.

## Refresh the documentation

`scripts/scrape-docs.mjs` crawls every same-origin HTML link reachable from the
homepage, including the full MkDocs navigation. It saves documentation as Markdown only, with a browsable Markdown index
and a JSON crawl manifest containing source URLs and SHA-256 hashes.
Code blocks are retained and tables are converted to Markdown. Images and external links
remain online references; this is a documentation snapshot, not an offline site mirror.

The site uses Cloudflare browser verification, so the scraper uses a connected
Codex Browser tab rather than raw HTTP. It does not export credentials or cookies.
In Codex, load the Browser skill and establish a browser connection following its
instructions, then run this in the persistent JavaScript tool (replace paths):

```js
const { createScraper } = await import('C:/path/to/murloc-mdt-viz/scripts/scrape-docs.mjs');
const tab = await browser.tabs.new();
await tab.goto('https://docs.nilname.com/');
// Allow normal browser verification to finish. Handle any interactive prompt manually.
const scraper = await createScraper(tab, {
  output: 'C:/path/to/murloc-mdt-viz/docs/nilname',
});
await scraper.batch(10);
// Repeat batch(10) until complete is true; inspect progress between batches.
```

Requires Node.js with ES modules and the Codex Browser plugin. The scraper accepts
the documented tab API (`url`, `goto`, `playwright.locator`, `playwright.evaluate`)
and has no npm dependencies. Each batch updates the manifest. Failures stop the
run, remain recorded, and never produce a success claim. To retry, create a new
scraper and run from the homepage. Existing files are overwritten; stale pages
from earlier snapshots are not deleted and are excluded from the new index.

Coverage is limited to linked HTML documentation; unlinked pages cannot be
discovered. Original documentation remains attributable to its respective authors;
this repository does not grant a new license to the copied content.

Run the crawler utility checks with `node --test tests/scrape-docs.test.mjs`.
Verify snapshot completeness, file hashes and Markdown-only storage with
`python tests/verify_snapshot.py` (Python 3, standard library only).
