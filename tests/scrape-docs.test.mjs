import test from 'node:test';
import assert from 'node:assert/strict';
import { canonicalUrl, pagePath } from '../scripts/scrape-docs.mjs';

test('keeps docs links, deduplicates anchors and excludes external resources', () => {
  assert.equal(canonicalUrl('/API/Guidelines/#example'), 'https://docs.nilname.com/API/Guidelines/');
  assert.equal(canonicalUrl('https://example.com/'), null);
  assert.equal(canonicalUrl('/image.png'), null);
  assert.equal(canonicalUrl('/?search=foo'), null);
  assert.equal(canonicalUrl('mailto:hello@example.com'), null);
});

test('output paths stay relative and encode Windows-special characters', () => {
  assert.equal(pagePath('https://docs.nilname.com/'), 'index');
  assert.equal(pagePath('https://docs.nilname.com/API/CON/'), 'p-API/p-CON/index');
  const path = pagePath('https://docs.nilname.com/a%2Fb/evil:name/');
  assert.ok(!path.includes(':'));
  assert.ok(!path.includes('..'));
  assert.ok(!path.startsWith('/'));
});
