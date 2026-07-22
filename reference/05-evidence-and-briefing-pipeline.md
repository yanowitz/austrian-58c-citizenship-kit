# Organizing evidence and assembling the attorney/authority briefing

Once you've pulled records (see the browser-automation reference), you need to (a)
track every item in a single provenance register, (b) track the *gaps* in a
punch-list, and (c) assemble a briefing that a lawyer or a consulate/MA35 caseworker
can read in five minutes. This reference generalizes the pattern that produced a
consult-ready §58c briefing + exhibit bundle.

---

## 1. The evidence register (single source of truth)

One table, one file, every evidence item. This is the backbone — the briefing's
evidence table and the exhibit provenance blocks are both *derived from it*, so you
maintain provenance in exactly one place. Group rows by what each item proves:

- **A. Persecution / refugee status** — the anchor of a §58c claim.
- **B. Identity & origin** — birth record, birthplace/DOB, the ancestor's own
  documents establishing they were the persecuted Austrian.
- **C. Descent chain** — the unbroken line from the persecuted ancestor down to each
  applicant (each birth/marriage certificate linking one generation to the next).
- **D. Inferences** — anything you *reasoned* rather than *documented*. Flag these
  explicitly; never let an inference masquerade as a record in the briefing.
- **E. Open / pending doors** — leads not yet resolved into evidence.

**Columns per item:**

| Column | What goes in it |
|---|---|
| # | Stable id within its group (A1, A2, B1…) so you can cross-reference |
| Evidence | The document, in plain words |
| What it proves | The one §58c fact it supports |
| Repository / source | The archive that holds it |
| Reference | The stable archival citation (series/file/record number) |
| Our copy | The filename you saved, so anyone can find it on disk |
| Source tier | T1 = official government/archive original · T1-fam = official record but the datum was family-submitted (e.g. a Yad Vashem Page of Testimony) · T2 = institutional/secondary/index · INFERENCE = your reasoning |
| Status | have / ordered / pending / referenced |

A few discipline rules that pay off:

- **Distinguish "reference" from "obtained-via."** The reference (the archival
  citation) is stable and is what someone uses to re-pull the record. How *you* got
  your copy (a trial account, an archivist's email, an inquiry number) is a separate
  fact. Conflating them makes the register un-auditable.
- **Tier every load-bearing item.** An *index/transcription* (e.g. a JewishGen entry
  for a birth record) is not the *original register scan* — mark it T2-index with the
  original pending, so nobody over-claims it as the primary document.
- **Reconcile, don't duplicate.** If two records look like the same event (a
  "parents' marriage" that turns out to be the ancestor's *own* marriage), fix the
  register and note the correction rather than carrying both.

---

## 2. The document punch-list (gap tracking)

The register tracks what you *have*; the punch-list tracks what you still *need* —
the applicant-side documents and the ordering/apostille mechanics. Work it top-down,
longest-lead-item first. For a §58c filing the applicant-side items are typically:

- Each applicant's **own birth certificate** + apostille.
- Each applicant's **police/criminal-record background check** + apostille (often
  the only long-lead item — start it first).
- The **descent-chain certificates** the applicant must supply (parent's,
  grandparent's birth/marriage certificates linking the generations).
- Passports / photos to the required (EU) spec.
- Any **name-change or amendment** bridge documents (court orders, apostilled).

For each item track: what it is, which office issues it, whether it needs an
apostille and *which* apostille authority (this depends on the issuing
jurisdiction — federal vs. each state vs. the foreign country), current status, and
any decision already made. Keep a small **apostille key** table mapping
issuer → apostille office, because that mapping is the part everyone gets wrong.

Capture the *decisions* inline (e.g. "chose to apostille the current birth
certificate + name-change order rather than gate on a slow amendment"), because the
reasoning is what you'll otherwise re-litigate three sessions later.

---

## 3. The exhibit bundle index / cover sheet

When you promote register items into a numbered exhibit set for the briefing, write
a short **index** that lists each exhibit (number, document, what it proves,
reference, tier) and — critically — a **scope note** stating what you *deliberately
excluded*. A §58c briefing should carry only what bears on the case (the persecution
anchor + the descent chain); pure family-history material (a sibling's full file, a
collateral line, institutional correspondence unrelated to the claim) is out of scope and saying so keeps the
bundle tight and the lawyer's time focused.

Alongside the index, keep a **per-exhibit provenance file**: one block per exhibit
with source, reference, obtained-via, URL, access-date, and a "why included" line.
These blocks become the cover pages in the rendered PDF (see the render pipeline).

---

## 4. Assembling the briefing itself

The briefing is a single document the lawyer/authority reads before the consult.
Structure that worked:

1. **Title / metadata** — who it's for, the consult date, what the document is
   ("briefing + exhibits, one combined PDF").
2. **A humility disclaimer up front.** A short italic note that your questions are a
   layperson's starting point, may rest on wrong assumptions, and you'd welcome being
   corrected. This sets the right tone with an expert and invites teaching rather than
   a defensive answer. *(This is genuinely load-bearing — keep it.)*
3. **"The case in three lines."** The claim in one short paragraph: which statute,
   which persecuted ancestor, the one-line persecution fact, and who is filing. Then
   the **descent chain** rendered as an explicit arrow chain
   (ancestor → … → applicant → applicant's children), so the line is graspable at a
   glance.
4. **The evidence table, grouped A–E, with a Status column.** This is the heart.
   Merge "held" and "pending" into one table per group and let the **Status** column
   carry the state — `Exhibit N` for something in the bundle, *italic* "ordered / in
   progress / pending" for what's still coming. Reviewers can see the whole
   evidentiary picture — strengths and holes — in one pass. Keep prose out of the
   cells; state what each document *proves* in a phrase, don't argue it.
5. **Questions, numbered, in priority order.** The concrete things you need the
   expert to resolve — sufficiency to file, filing strategy, mechanics, edge cases
   specific to your applicants. Numbering makes them addressable in the reply.
6. **Exhibits follow in the same document**, each behind a provenance cover block
   (rendered — see the render pipeline reference).

Editorial rules that kept it credible: **no over-claiming prose** (let the documents
speak; don't editorialize their strength), flag every inference *as* an inference,
and keep the applicant-role language plain. Maintain the briefing as a human-readable
markdown source of truth and keep the render source (Typst) in sync with it by hand —
the markdown is the canonical copy.
