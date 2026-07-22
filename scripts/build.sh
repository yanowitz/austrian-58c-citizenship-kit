#!/bin/bash
# =====================================================================
# Build the §58c briefing + exhibits PDF.
#
# PREREQUISITES:
#   - typst           (required — the render itself)
#   - poppler         (optional — only if you need to (re-)rasterize
#                      source PDFs into exhibit JPGs; provides pdftoppm)
#
# BEFORE BUILDING:
#   1. Fill in bundle.template.typ (replace every [BRACKETED] placeholder).
#   2. Render your source document PDFs into exhibits/ex-*.jpg, e.g.:
#        pdftoppm -jpeg -jpegopt quality=82 -scale-to-x 1500 -scale-to-y -1 \
#          ../path/to/SOURCE.pdf exhibits/ex1
#      (add -f <first> -l <last> to restrict to specific pages)
#      See reference/06-render-pipeline.md for the full image<->source map.
#   3. Point the docpage("exhibits/ex-*.jpg", ...) calls at those files.
#
# --root . is REQUIRED: images are referenced by relative path, and Typst
# refuses paths outside the compile root.
# =====================================================================
set -euo pipefail

cd "$(dirname "$0")"          # run from scripts/ regardless of caller
typst compile bundle.template.typ ../output.pdf --root .

echo "Built: $(cd .. && pwd)/output.pdf"
