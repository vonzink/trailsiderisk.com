#!/usr/bin/env bash
# Generate a navigable LOCAL preview from the production files.
# Images already point at the live GHL CDN, so we only rewrite the GHL slugs
# (/, /about, ...) into local .html file links so navigation works on disk.
# Output goes to ./preview/. Throwaway — never paste these into GHL.
set -euo pipefail
cd "$(dirname "$0")"
rm -rf preview
mkdir -p preview

for f in index about services contact; do
  sed \
    -e 's|href="https://trailsiderisk.com"|href="index.html"|g' \
    -e 's|href="/#approach"|href="index.html#approach"|g' \
    -e 's|href="/about"|href="about.html"|g' \
    -e 's|href="/services"|href="services.html"|g' \
    -e 's|href="/contact"|href="contact.html"|g' \
    -e 's|href="/"|href="index.html"|g' \
    "$f.html" > "preview/$f.html"
done

echo "Wrote preview/ -> open preview/index.html"
