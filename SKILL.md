---
name: austrian-58c-citizenship
description: >-
  Research and assemble an Austrian citizenship claim under §58c StbG — the route for
  descendants of people persecuted by the Nazi regime to reclaim Austrian (and thus EU)
  citizenship. Use when someone wants to check §58c eligibility, trace and document a
  persecuted Austrian ancestor across Holocaust-era and refugee archives, build the
  descent chain, draft records-request emails, or produce a consulate/attorney-ready
  evidence briefing PDF. Works for any applicant country and any country the ancestor
  fled to.
---

# Austrian Citizenship via §58c StbG — a research & document-assembly kit

**What this is.** A practical, reusable kit for pursuing Austrian citizenship under **§58c** of the
Austrian Citizenship Act — the provision that lets **direct descendants of people persecuted by the
Nazi regime** reclaim Austrian (and therefore EU) citizenship. There is **no generational cap** and
**dual citizenship is allowed**. It was assembled from one family's real, successful research
process and generalized so anyone can run it for their own ancestor.

**Who it's for.** Two audiences:
- **Claude Code users** — point Claude at this skill and it can drive logged-in archives in a
  browser, organize your evidence, draft your records-request emails, and render the final PDF.
- **Anyone** — the reference files and `GUIDE.md` read as a plain how-to even with no tools. Non-
  technical readers should start with **`GUIDE.md`**.

**Not legal advice.** This is a research and document-organization aid, written by a fellow
applicant, not an attorney. §58c is a *declaration*, not a discretionary application, and you are
**not required to hire a lawyer** — but for a hard case, confirm specifics with your competent
Austrian consulate or an Austrian attorney. Laws and office practices change; verify the load-bearing
facts against official sources before you rely on them.

---

## The shape of a §58c case

Almost every case has the same structure, and understanding it up front saves months:

1. **Eligibility is usually the easy part; documentation is the work.** A clean "my ancestor fled the
   Nazis" story almost always qualifies. The effort goes into *proving* it.
2. **Two research fronts run in parallel** — (A) proving the ancestor was Austrian and fled/suffered
   persecution, and (B) proving the descent chain from that ancestor down to you. They come from
   different archives and don't block each other.
3. **Austria does some of the work for you.** The deciding authority (MA35 in Vienna) searches
   Austrian archives itself — so the ancestor's Austrian birth record and last address are, by
   design, often *not your problem*. You can file without them.
4. **File the declaration; your retroactive citizenship date is the day MA35 *receives* it** (not the
   approval date — and, because the consulate forwards it, possibly a bit later than the day you hand it
   in). Don't let a non-essential gap delay filing.

---

## How to use this skill (recommended workflow)

Work the steps in order; each maps to a reference file.

- **Step 0 — Check eligibility.** Read `reference/01-eligibility-and-process.md`. Confirm the ancestor
  fits the limbs (Austrian/successor-state/stateless · had a main residence in Austria · **went abroad —
  emigrated from Austria — before 15 May 1955 because of Nazi persecution**; note the 1955 date bounds
  the *departure*, so an ancestor who stayed past then doesn't qualify) and that you're a direct descendant.
- **Step 1 — Map your two fronts.** List what proves the *persecution/flight* story and what proves
  the *descent chain*. Start an evidence register (`reference/05-evidence-and-briefing-pipeline.md`)
  with three columns per item: *what it proves · where it comes from · have/need*.
- **Step 2 — Work the archives.** Use `reference/02-source-playbook.md`. Hit the **destination-
  independent core** first (Arolsen Archives, DÖW Gedenkbuch, Yad Vashem, IKG Wien, Wiener Stadt- und
  Landesarchiv, ÖStA, findbuch.at), then the **archives of the country your ancestor fled to** (the
  UK set is fully worked; other destinations are mapped by record-type).
- **Step 3 — Send the email/postal requests.** Many records aren't online. Use the ready-to-send,
  fill-in-the-blank templates in `reference/03-email-request-templates.md`.
- **Step 4 — (Claude Code users) drive the logged-in archives.** For subscription/login sites
  (Findmypast, Arolsen, national-archive catalogues), `reference/04-browser-automation.md` shows how
  to let Claude search, open records, and save both the transcript and the full-resolution image with
  its provenance.
- **Step 5 — Assemble the briefing.** Consolidate everything into one evidence register + a briefing
  document (`reference/05-evidence-and-briefing-pipeline.md`): the descent chain, the evidence table
  with a *status* column, open questions, and an honest documented-vs-inferred split.
- **Step 6 — Render the PDF.** Produce one clean PDF = briefing + numbered exhibits, each with a
  provenance cover block, using the Typst pipeline in `reference/06-render-pipeline.md` and the
  templates in `scripts/`.
- **Step 7 — Decide DIY vs. firm, then file.** `reference/07-firms-vs-diy.md` covers vetting an
  Austrian §58c attorney vs. self-filing, and the self-filer's sequence. Then complete the official
  online questionnaire for **your** consular district and submit your declaration.

Throughout, watch the **gotchas** (`reference/08-applicant-gotchas.md`) — the realities of MA35, the
apostille/criminal-record/translation mechanics (US example plus the general shape for any country),
document validity windows, and the traps that sink otherwise-clean cases.

See `examples/worked-example-anonymized.md` for the whole method in action on one composite chain.

---

## File map

| File | What's in it |
|---|---|
| `GUIDE.md` | Plain-language standalone guide — start here if you don't use Claude Code |
| `reference/01-eligibility-and-process.md` | Who qualifies · where/how to file · fees · questionnaire · document checklist |
| `reference/02-source-playbook.md` | Every archive: what it holds, URL, how to search, web vs. email — core + by destination country |
| `reference/03-email-request-templates.md` | Ready-to-send, fill-in-the-blank records-request emails |
| `reference/04-browser-automation.md` | (Claude Code) driving logged-in archive sites to search + save records |
| `reference/05-evidence-and-briefing-pipeline.md` | Evidence register + gap tracking + how to build the briefing |
| `reference/06-render-pipeline.md` | Rendering the final briefing + exhibits PDF (Typst) |
| `reference/07-firms-vs-diy.md` | Vetting an attorney vs. DIY; the self-filer's sequence |
| `reference/08-applicant-gotchas.md` | MA35 realities, apostille/FBI/translation mechanics, validity windows, traps |
| `examples/worked-example-anonymized.md` | The full method walked end-to-end on an anonymized composite case |
| `scripts/bundle.template.typ`, `scripts/build.sh` | Typst template + build script for the exhibit-bundle PDF |

---

## Credits & sharing

Built from a real §58c research process and generalized for reuse. **Freely shareable** — pass it
around your family, your genealogy group, or fellow applicants. All personal case data has been
removed; the worked example is an anonymized composite, not a real individual. If you improve it,
pass the improved version on.
