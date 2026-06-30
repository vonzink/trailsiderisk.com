# Trailside Risk Partners — Website

Four self-contained marketing pages built for **GoHighLevel (GHL)**. Each `.html` file
holds **all** its CSS (`<style>`) and JS (`<script>`) inline and is scoped under a single
`.trsp` root — so you can paste the whole file into a GHL **Custom Code / HTML** block
without it fighting GHL's global styles.

## Pages

| File | GHL slug | Root id |
|---|---|---|
| `index.html` | `/` | `trsp-home` |
| `about.html` | `/about` | `trsp-about` |
| `services.html` | `/services` | `trsp-services` |
| `contact.html` | `/contact` | `trsp-contact` |

Cross-page links are root-relative (`/about`, `/services`, `/contact`), so on the live
domain they resolve to `trailsiderisk.com/about`, etc.

## Images — already wired

Image `src`s now point directly at your **GHL Media Library** URLs, so you can paste each
page as-is — **no find-and-replace needed**.

| Image | URL in use |
|---|---|
| Color logo (nav) | `…/6a43306d3a7f0c5468a30307.png` |
| Footer logo | `…/6a27199319b4ff338be5c813.png` (transparent color logo, CSS-knocked-out to white) |
| Founder headshot | `…/6a43306d06fe2e51dce41e9b.jpeg` |

The dark footer renders the logo white via `filter:brightness(0) invert(1)` on the
transparent color logo (no separate white file needed). To swap in a real white logo later,
point `.trsp__footer-logo`'s `src` at it and remove that `filter`.

The local copies in `assets/` are the originals, kept for reference only.

## Paste into GHL

1. Create the page/funnel step and set its slug (`/`, `/about`, `/services`, `/contact`).
2. Add one full-width **Custom Code / HTML** element and paste the entire `.html` file.
3. **Contact form:** set `action="__GHL_FORM_ACTION__"` to your form webhook, **or** delete the
   `<form class="trsp__form">…</form>` block and drop in a native GHL Form element (the
   surrounding markup is namespaced and built to be swapped). With the placeholder left in
   place, the form validates and shows an inline "thank you" instead of posting.

## Notes baked in

- **GHL-safe:** no global `body`/`*`/bare-tag CSS; every rule is scoped under `.trsp` (the
  link reset uses `:where(.trsp) a` so it never overrides component colors), keyframes are
  prefixed `trsp-`, and the JS is an init-guarded IIFE that only queries inside its own root
  (safe against GHL re-injecting the block).
- **Fail-visible:** if JS is disabled, all content shows (the hidden-until-revealed state is
  only added by JS via a `.js-ready` class). Stat numbers render their final value in markup.
- **Reduced motion:** `prefers-reduced-motion` disables parallax, float loops, and reveals.
- **Responsive:** desktop → tablet → mobile, with a hamburger menu under ~820px.
- **ASCII-clean:** all special punctuation is HTML entities, so it renders regardless of charset.
- Phone `303-949-1147`, email `aaron@trailsiderisk.com`, hours `Mon–Fri 8am–5pm MT`
  (placeholder — confirm/replace). Update these by find-and-replace if they change.

## Spare assets (not placed on the site)

You also uploaded a couple of marketing assets that aren't used in the pages — drop them in
wherever you like:

- Mountain icon (transparent): `…/6a271994b7519e9ccc4e6646.png`
- QR code → site: `…/6a27199c2db4a9d19adeccc8.png`
- QR code → contact: `…/6a27199cb7519e9ccc4e675e.png`

## Local preview (optional)

The root files use GHL slugs (`/about`, …) that don't resolve as local files. To generate a
navigable local copy (slugs → file links; images load from the GHL CDN):

```bash
./build-preview.sh
open preview/index.html
```

`preview/` is throwaway — regenerate any time. Paste the production files from the repo root
into GHL, not the preview copies.
