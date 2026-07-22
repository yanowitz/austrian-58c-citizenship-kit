# Driving logged-in archive sites with Claude's browser tools

Most of the primary records for a §58c (Austrian citizenship-by-descent for the
persecuted-and-their-descendants) case live behind login walls or in JS-rendered
catalogues that a plain HTTP fetch returns empty from. The reliable way to pull
them is to point Claude Code's **chrome-devtools MCP** tools at a browser *you have
already logged into*, then have Claude do the searching, open the record, and
screenshot both the transcript and the full-resolution image.

This is **Claude-Code-specific**: it assumes you're running Claude Code with the
`chrome-devtools` MCP server attached (tools like `navigate_page`, `take_snapshot`,
`take_screenshot`, `click`, `fill`, `evaluate_script`, `list_network_requests`).
The archives this pattern was proven against: **Findmypast** (1939 Register,
digitised HO 396 enemy-alien cards), **The National Archives "Discovery"**
catalogue (HO 334 naturalisation certs, HO 405 case files), and the **Arolsen
Archives** inquiry portal (ITS tracing/documentation cases). The same loop works
for Ancestry, FamilySearch, JewishGen, and any consulate/Salesforce content link.

---

## 0. Why not just fetch the URL?

Two failure modes you'll hit constantly, and the fix for each:

- **JS-rendered catalogue pages** (TNA Discovery detail pages, Findmypast records)
  return an empty shell to a headless fetch — the data loads client-side. Drive a
  real browser instead, OR, where the site exposes one, hit its **JSON API**
  directly. TNA Discovery has one: `discovery.nationalarchives.gov.uk/API/search/records`
  returns full catalogue entries (reference, description, closure status, holding
  location) as JSON — no browser needed for the *search*, only for ordering/imaging.
- **Login-walled record images** (Findmypast transcripts + full-res scans, Ancestry
  images, an emailed Salesforce/consulate content-distribution viewer) can't be
  fetched at all without the session cookie. Here the browser Claude drives *is*
  the authenticated session — so the loop below is the only route.

Rule of thumb: **API for the search when one exists; browser for anything gated,
imaged, or JS-rendered.**

---

## 1. Setup — the human logs in first

Claude cannot (and should not) type your archive passwords. The handoff is:

1. You open the browser Claude is driving (the chrome-devtools MCP browser) and
   **log in yourself** to the archive — Findmypast, Ancestry, your Arolsen inquiry
   account, whatever. Complete any 2FA. Leave the tab on the site's search page.
2. Tell Claude the session is live ("I'm logged into Findmypast, go").
3. From here Claude only *navigates, searches, reads, and screenshots* inside your
   authenticated session. It never handles credentials.

If the site logs you out mid-run, Claude will see a login redirect in a snapshot —
it should stop and ask you to re-authenticate rather than trying to log in itself.

---

## 2. The navigate → search → screenshot → save loop

For each record you're chasing, Claude runs this loop:

1. **Navigate.** `navigate_page` to the archive's search URL (or click through from
   the current page).
2. **Read the page structure.** `take_snapshot` returns the accessibility tree with
   stable element IDs (form fields, buttons, result links). Prefer the snapshot to a
   screenshot for *locating* things — it gives you the ID you pass to `click`/`fill`.
3. **Fill the search.** `fill` the surname / given-name / birth-year fields by their
   snapshot IDs, then `click` the search button. **Run every name-spelling variant**
   — persecuted-ancestor surnames were routinely transliterated (an umlaut becomes
   `ue`, or is dropped): search the plain spelling, the `ue`-for-umlaut spelling,
   the umlaut spelling, any married name, etc., each as a separate query. A zero-result page for one spelling is itself worth capturing
   (it documents that you looked).
4. **Open the record.** `click` the result row. `take_snapshot` again to confirm you
   landed on the record detail (not an interstitial or paywall).
5. **Screenshot the transcript.** `take_screenshot` of the transcription / index
   view (the typed metadata: name, DOB, birthplace, reference number, series). This
   is the human-readable layer.
6. **Open and screenshot the full-resolution image.** Click through to the record
   *image* (the actual scan), zoom/expand it to full size, and `take_screenshot`
   again — or, if the site serves the image as a downloadable file, capture its URL
   from `list_network_requests` and download it directly (see §3). **You want both**:
   the transcript proves what the record *says*; the image proves the record
   *exists* and is authentic.
7. **Save with a descriptive filename** encoding source + person + reference, e.g.
   `findmypast-1939register-<person>-transcript.png`,
   `1939register-FULLRES-<person>-RG101-<piece>-<item>.jpg`. The reference in the
   filename is what lets you cite it later without re-opening the site.

Repeat per record. Batch the independent searches — variant spellings and separate
people (siblings, parents, guarantors) can each be their own pass.

---

## 3. Grabbing the actual image file (not just a screenshot)

A `take_screenshot` gives you a viewport-resolution PNG, which is fine for a
transcript but often too low-res for a scanned document you'll print into an exhibit
bundle. To get the **native full-resolution image**:

- After the image loads, call `list_network_requests`. The scan is usually a large
  `.jpg`/`.png`/`.jp2` request. Note its URL.
- Fetch that URL *within the authenticated session* (the cookies are already set) —
  either by navigating to it and screenshotting at full zoom, or via
  `evaluate_script` to read/download the resource, or by handing the URL to a
  download step that carries the session cookie.
- Emailed/portal deliveries (e.g. an Arolsen result email links to a Salesforce
  Lightning content-distribution viewer, or a consulate sends a one-time link) are
  the same pattern: open the link in the driven browser, let the PDF/viewer load,
  and download the file. These links are often **public but unguessable** — capture
  the file promptly; don't rely on the link staying live.

Store full-res scans as JPGs; you'll compress them again at render time (see the
render pipeline reference).

---

## 4. Capture provenance AS YOU GO

The single most valuable habit: **record where each file came from at the moment you
save it**, not later from memory. For every record, capture:

- **Source / repository** — the archive that holds it (e.g. "UK National Archives,
  Kew"; "Arolsen Archives"; "World Jewish Relief").
- **Archival reference** — the *stable* catalogue citation (e.g. an HO 396 internment-card
  reference like `HO 396/<piece>/<item>`, a 1939 Register reference like
  `RG101/<piece>/<item>/<page>`, an Arolsen/ITS T/D case number, or a JewishGen/IKG
  register-entry citation). This
  is what a lawyer or MA35 caseworker uses to re-pull the record independently. It is
  distinct from how *you* got your copy.
- **Obtained-via** — your retrieval path (which site, which trial account, which
  archivist emailed it, which inquiry/order number). E.g. "Findmypast trial,
  agent-driven search"; "Arolsen online inquiry, Search Order 2026-…, delivered by
  email".
- **URL** — the record/detail URL or the API endpoint, if one exists. Note honestly
  when none was captured (many portal/email deliveries have no per-record permalink).
- **Access date** — when you retrieved it.
- **What it proves** — one line: the §58c fact this record supports (refugee status,
  flight Vienna→England, parent murdered, the descent link, etc.).

Write these straight into an evidence-register file (see the evidence-and-briefing
reference) keyed by the same filename you saved. A screenshot with no provenance
line is nearly worthless in a briefing — you can't cite what you can't source.

---

## 5. Gotchas learned the hard way

- **Umlaut/transliteration variants are not optional** — always run every spelling;
  the exact-match search will silently miss the record otherwise.
- **JS-rendered detail pages** return empty to a bare fetch; use the JSON API (TNA
  Discovery) or the driven browser.
- **Sessions expire** — if a snapshot shows a login page, stop and ask the human to
  re-auth. Don't attempt to log in.
- **Portal/email links can be public but ephemeral** — download the file the moment
  it loads; don't assume you can return to it.
- **Not every record has a URL** — that's fine; record `url: not captured` rather
  than inventing one. The archival *reference* is the durable citation, not the URL.
