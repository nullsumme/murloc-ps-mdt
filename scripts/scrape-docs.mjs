import { mkdir, writeFile } from 'node:fs/promises';
import { resolve, join } from 'node:path';
import { createHash } from 'node:crypto';

export const SOURCE = 'https://docs.nilname.com/';

// Keep the crawler on this documentation site; fragments do not identify pages.
export function canonicalUrl(value, base = SOURCE) {
  const url = new URL(value, base);
  if (url.origin !== new URL(SOURCE).origin || url.search) return null;
  if (/\.[a-z0-9]+$/i.test(url.pathname) && !/\.html?$/i.test(url.pathname)) return null;
  url.hash = '';
  return url.href;
}

export function pagePath(value) {
  const parts = new URL(value).pathname.split('/').filter(Boolean);
  // Preserve readable names; escape only unsafe characters and reserved names.
  const safe = parts.map(part => {
    const encoded = encodeURIComponent(part).replace(/\./g, '%2E');
    return /^(con|prn|aux|nul|com[1-9]|lpt[1-9])$/i.test(encoded)
      ? '%' + encoded.charCodeAt(0).toString(16).toUpperCase() + encoded.slice(1)
      : encoded;
  });
  if (!safe.length) return 'index';
  // The root index and README are generated files.
  if (safe.length === 1 && /^(index|readme)$/i.test(safe[0])) safe[0] = '%' + safe[0].charCodeAt(0).toString(16).toUpperCase() + safe[0].slice(1);
  return safe.join('/');
}

// Runs in the browser's read-only DOM scope. No fetch, cookies or app internals.
export function extractPage() {
  const article = document.querySelector('article');
  if (!article) throw new Error('No documentation article found; browser verification may be required.');
  function render(node) {
    if (node.nodeType === 3) return node.textContent.replace(/\s+/g, ' ');
    if (node.nodeType !== 1) return '';
    const tag = node.tagName.toLowerCase();
    if (['script', 'style', 'button'].includes(tag) || node.classList.contains('headerlink')) return '';
    const children = () => [...node.childNodes].map(render).join('');
    if (tag === 'pre') {
      const code = node.querySelector('code') || node;
      const text = code.textContent.replace(/\n$/, '');
      const runs = text.match(/`+/g) || [];
      const fence = '`'.repeat(Math.max(3, ...runs.map(s => s.length + 1)));
      const language = (node.parentElement.className.match(/language-([\w+-]+)/) || [])[1] || '';
      return '\n\n' + fence + language + '\n' + text + '\n' + fence + '\n\n';
    }
    if (tag === 'code') {
      const text = node.textContent;
      const fence = '`'.repeat(Math.max(1, ...(text.match(/`+/g) || []).map(s => s.length + 1)));
      return fence + ' ' + text + ' ' + fence;
    }
    if (/^h[1-6]$/.test(tag)) return '\n\n' + '#'.repeat(Number(tag[1])) + ' ' + children().trim() + '\n\n';
    if (tag === 'a') return '[' + children().trim() + '](' + node.href + ')';
    if (tag === 'img') return '![' + (node.getAttribute('alt') || '') + '](' + node.src + ')';
    if (tag === 'strong' || tag === 'b') return '**' + children() + '**';
    if (tag === 'em' || tag === 'i') return '*' + children() + '*';
    if (tag === 'br') return '\n';
    if (tag === 'table') {
      const rows = [...node.querySelectorAll('tr')].map(row =>
        [...row.querySelectorAll('th, td')].map(cell => render(cell).trim().replace(/\|/g, '\\|').replace(/\n/g, ' ')));
      if (!rows.length) return '';
      const width = Math.max(...rows.map(row => row.length));
      const line = row => '| ' + Array.from({ length: width }, (_, i) => row[i] || '').join(' | ') + ' |';
      return '\n\n' + [line(rows[0]), line(Array(width).fill('---')), ...rows.slice(1).map(line)].join('\n') + '\n\n';
    }
    if (tag === 'li') return '\n- ' + children().trim().replace(/\n/g, '\n  ');
    if (tag === 'blockquote') return '\n\n' + children().trim().replace(/^/gm, '> ') + '\n\n';
    if (['p', 'div', 'ul', 'ol', 'section', 'details', 'hr'].includes(tag)) return '\n\n' + children().trim() + '\n\n';
    return children();
  }
  return {
    title: article.querySelector('h1')?.textContent.trim() || document.title,
    markdown: render(article).trim() + '\n',
    links: [...document.querySelectorAll('a[href]')].map(a => a.href),
    images: [...article.querySelectorAll('img[src]')].map(img => img.src),
  };
}

/** Accepts a Codex Browser tab. Run bounded batches to expose progress. */
export async function createScraper(tab, { output = 'docs/nilname', delayMs = 300 } = {}) {
  const root = resolve(output);
  await mkdir(root, { recursive: true });
  const queue = [SOURCE];
  const discovered = new Set(queue);
  const pages = [];
  const failures = [];
  let cursor = 0;
  const startedAt = new Date().toISOString();

  async function saveManifest() {
    const manifest = {
      source: SOURCE, startedAt, updatedAt: new Date().toISOString(),
      complete: cursor === queue.length && failures.length === 0,
      discovered: queue.length, pending: queue.slice(cursor),
      pages: [...pages].sort((a, b) => a.url.localeCompare(b.url)), failures,
      scope: 'All same-origin HTML pages reachable from the homepage. Images and external links remain online references.',
    };
    await writeFile(join(root, 'manifest.json'), JSON.stringify(manifest, null, 2) + '\n');
    const index = '# Nil-Name documentation snapshot\n\nSource: ' + SOURCE + '\n\n' +
      `Captured ${pages.length} of ${queue.length} discovered pages; ${failures.length} failures.\n\n` +
      manifest.pages.map(p => `- [${p.title.replace(/[\[\]]/g, '')}](${p.path}.md)`).join('\n') + '\n';
    await writeFile(join(root, 'README.md'), index);
    return manifest;
  }

  return {
    async batch(limit = 10) {
      for (let count = 0; count < limit && cursor < queue.length; count++) {
        const url = queue[cursor++];
        try {
          if (await tab.url() !== url) await tab.goto(url);
          await tab.playwright.locator('article').waitFor({ state: 'attached', timeoutMs: 20000 });
          const actual = canonicalUrl(await tab.url());
          if (!actual) throw new Error('Redirected outside documentation scope');
          const data = await tab.playwright.evaluate(extractPage);
          for (const link of data.links) {
            const next = canonicalUrl(link, actual);
            if (next && !discovered.has(next)) { discovered.add(next); queue.push(next); }
          }
          const path = pagePath(url);
          await mkdir(resolve(root, path, '..'), { recursive: true });
          const markdown = `<!-- Source: ${url} -->\n\n` + data.markdown;
          await writeFile(join(root, path + '.md'), markdown);
          pages.push({ url, finalUrl: actual, title: data.title, path,
            sha256: createHash('sha256').update(markdown).digest('hex'), images: data.images });
        } catch (error) {
          failures.push({ url, error: error.message });
          // Stop at a failed page so verification prompts are handled by a human.
          await saveManifest();
          throw error;
        }
        if (delayMs) await new Promise(r => setTimeout(r, delayMs));
      }
      const manifest = await saveManifest();
      return { saved: pages.length, discovered: queue.length, pending: queue.length - cursor,
        failures: failures.length, complete: manifest.complete };
    },
  };
}
