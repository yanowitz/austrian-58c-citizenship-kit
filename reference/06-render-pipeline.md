# Rendering the final briefing + exhibits PDF

The deliverable is **one A4 PDF** = the typeset briefing followed by numbered
exhibits, each exhibit behind a provenance cover block and a normalized document
image. It's built with **Typst**, not by concatenating source PDFs — Typst gives you
consistent typography, the repeatable exhibit cover-block layout, and a controlled
image frame, all from one editable source.

Template files live in `scripts/`:
- `scripts/bundle.template.typ` — the generic Typst source (briefing markup +
  `exhibit()` / `docpage()` helpers + placeholder content).
- `scripts/build.sh` — the one-command build.

---

## 1. What the build produces

`bundle.template.typ` contains three things:

1. **Helper functions** at the top:
   - `evtable(rows)` — renders an evidence table (Document · What it proves · Status).
   - `exhibit(num, title, source, reference, obtained, url, why)` — the per-exhibit
     **provenance cover block** (a titled header line plus a labeled grid: Source /
     Reference / Obtained via / Link / Why included).
   - `docpage(path, caption)` — a full-page, page-broken, centered image with a small
     caption, for the document scan itself.
2. **The briefing body** — case summary, the grouped evidence tables, and the
   numbered questions, written as Typst markup.
3. **The exhibits** — a repeated `exhibit(...)` cover block followed by one or more
   `docpage(...)` calls per exhibit.

Output is a single paginated A4 PDF with page numbers.

---

## 2. The rebuild command (fast path — images already rendered)

```bash
cd scripts
typst compile bundle.template.typ ../output.pdf --root .
```

`--root .` is **required** because the template references images by relative path
(`exhibits/ex-*.jpg`); without it Typst refuses paths outside the compile root.

`build.sh` wraps exactly this. The exhibit JPGs are kept pre-rendered next to the
template so a rebuild is instant — no re-rasterizing needed when you only edit text.

---

## 3. Re-rendering the exhibit images (only when scans change)

The exhibit images are JPEG renders of the source document PDFs, produced with
`pdftoppm` (from **poppler**). Rendering to JPEG at a bounded width is a large size
win over PNG while staying legible for print:

```bash
# from scripts/, render every page of a source PDF to exhibits/ex-<name>-<page>.jpg
pdftoppm -jpeg -jpegopt quality=82 -scale-to-x 1500 -scale-to-y -1 \
  ../path/to/SOURCE.pdf exhibits/ex-<name>

# restrict to specific pages (e.g. only the 3 substantive pages of a 9-page file):
pdftoppm -jpeg -jpegopt quality=82 -scale-to-x 1500 -scale-to-y -1 \
  -f 5 -l 7 ../path/to/SOURCE.pdf exhibits/ex-<name>
```

- `quality=82`, `-scale-to-x 1500` (width 1500px, height auto) is a good
  legible/compact balance for scanned documents.
- Keep a small **image ↔ source-PDF map** in your build notes (which `ex-*.jpg` came
  from which source PDF, which pages), so a future re-render is unambiguous. Prune
  multi-page files to just the substantive pages to keep the bundle lean.

Then point the `docpage("exhibits/ex-<name>-<page>.jpg", "<caption>")` calls at the
rendered files.

---

## 4. Editing content

- **Briefing text** (case summary, evidence tables, questions): edit the `= Briefing`
  / `== 1..3` sections near the top of the template. Keep your canonical markdown
  briefing in sync by hand — the markdown is the human-readable source of truth, the
  Typst is the render.
- **Exhibit cover text** (source / reference / obtained-via / why): edit the
  `#exhibit("N", ...)` calls at the bottom.
- **Design** (fonts, spacing, cover-block layout, image frame size): the
  `#let exhibit(...)`, `#let docpage(...)`, `#let evtable(...)` helpers at the top.

---

## 5. Dependencies

- **Required:** `typst` (the only hard dependency for the render itself).
- **Optional:** `pdftoppm` / `pdfinfo` (from **poppler**) to (re-)rasterize source
  PDFs into the exhibit JPGs, and to check page counts. If your exhibit images are
  already rendered, you don't need poppler to rebuild.
- **Font:** the template uses a common system sans (e.g. Helvetica). If it's absent,
  set `#set text(font: "...")` to a font you have.

Environment notes worth knowing: image tools like ImageMagick / Ghostscript / qpdf
are **not** required — `pdftoppm`'s JPEG-at-render handles both rasterization and
size, so there's no separate compression or PDF-optimization step. If a scan has an
ugly border (e.g. a black card edge), the pipeline leaves it as-is rather than
auto-cropping. Write Unicode arrows as ASCII `->` in the Typst source to dodge any
glyph gaps; `§`, umlauts, accents, and em-dashes render fine in a normal font.
