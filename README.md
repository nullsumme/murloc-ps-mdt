# Murloc MDT

Documentation reference snapshot from [Nil-Name Docs](https://docs.nilname.com/).
Browse the [downloaded documentation](docs/nilname/README.md).

## Refresh the documentation

`scripts/scrape-docs.mjs` crawls every same-origin HTML link reachable from the
homepage, including the full MkDocs navigation. It writes Markdown, original
article HTML, a browsable index, and a JSON manifest with source URLs and SHA-256
hashes. Code blocks and HTML tables are retained. Images and external links
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
Verify snapshot completeness, file hashes and code preservation with
`python tests/verify_snapshot.py` (Python 3, standard library only).
