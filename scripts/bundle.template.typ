// =====================================================================
// GENERIC §58c BRIEFING + EXHIBITS TEMPLATE (Typst)
//
// This is a fill-in-the-blanks template. Replace every [BRACKETED]
// placeholder with your own content, point the docpage() images at your
// rendered exhibit JPGs (see reference/06-render-pipeline.md), and build:
//
//     cd scripts
//     typst compile bundle.template.typ ../output.pdf --root .
//
// --root . is required — images are referenced by relative path.
// =====================================================================

#set document(title: "§58c Consult Briefing — [APPLICANT NAME]")
#set page(paper: "a4", margin: (x: 2cm, top: 1.8cm, bottom: 1.5cm), numbering: "1")
#set text(font: "Helvetica", size: 10.5pt)   // swap font if Helvetica is absent
#set par(justify: false, leading: 0.62em)
#show heading.where(level: 1): it => block(above: 1.1em, below: 0.7em)[#text(size: 15pt, weight: "bold")[#it.body]]
#show heading.where(level: 2): it => block(above: 0.9em, below: 0.5em)[#text(size: 11.5pt, weight: "bold", fill: rgb("#333"))[#it.body]]

// ---------- Evidence table helper ----------
#let evtable(rows) = {
  table(
    columns: (2.1fr, 3fr, 1.5fr),
    stroke: none,
    inset: (x: 4pt, y: 5pt),
    fill: (_, row) => if row == 0 { rgb("#f0f0f0") } else { none },
    table.header(
      text(weight: "bold", size: 9.5pt)[Document],
      text(weight: "bold", size: 9.5pt)[What it proves],
      text(weight: "bold", size: 9.5pt)[Status],
    ),
    ..rows.map(r => (
      text(size: 9.5pt)[#r.at(0)],
      text(size: 9.5pt)[#r.at(1)],
      text(size: 9.5pt)[#r.at(2)],
    )).flatten()
  )
  v(2pt)
}

// ---------- Exhibit cover block (repeatable provenance page) ----------
#let exhibit(num, title, source, reference, obtained, url, why) = {
  text(size: 9pt, fill: rgb("#999"), weight: "bold", tracking: 2pt)[EXHIBIT #num]
  v(2pt)
  text(size: 17pt, weight: "bold")[#title]
  v(8pt)
  line(length: 100%, stroke: 0.7pt + rgb("#ccc"))
  v(8pt)
  grid(columns: (auto, 1fr), gutter: 12pt, row-gutter: 7pt,
    text(weight: "bold", fill: rgb("#555"))[Source],       [#source],
    text(weight: "bold", fill: rgb("#555"))[Reference],    [#reference],
    text(weight: "bold", fill: rgb("#555"))[Obtained via], [#obtained],
    text(weight: "bold", fill: rgb("#555"))[Link],         [#url],
    text(weight: "bold", fill: rgb("#555"))[Why included], [#why],
  )
}

// ---------- Full-page document image ----------
#let docpage(path, caption) = {
  pagebreak()
  block(width: 100%, height: 24cm)[
    #align(center + horizon)[#image(path, fit: "contain", width: 100%, height: 100%)]
  ]
  align(center)[#text(size: 8pt, fill: rgb("#999"))[#caption]]
}

// =====================================================================
// BRIEFING
// =====================================================================

= §58c Consult Briefing — [APPLICANT NAME]

#text(weight: "bold")[Prepared ahead of our [CONSULT DATE] call. The evidence exhibits referenced below (Exhibits 1–[N]) follow this briefing in the same document.]

#v(6pt)
// Humility disclaimer — keep this; it sets the right tone with an expert.
#text(style: "italic", fill: rgb("#444"))[A note before the questions: I'm coming to you for your expertise, so please treat the questions below as a starting point, not a framework. They're the questions that have occurred to me as a layperson, and some of them may rest on wrong assumptions — I don't know what I don't know. Where a question is naive or built on a false premise, I'd be grateful for your teaching and counsel.]

== 1. The case in three lines

I'm seeking Austrian citizenship under *§58c StbG* by descent from my [RELATIONSHIP — e.g. maternal grandmother], *[PERSECUTED ANCESTOR NAME]* — a Viennese Jew who fled [CITY] to [COUNTRY] as a refugee in [YEARS]. [ONE-LINE PERSECUTION FACT — e.g. "Her parents were murdered in the Holocaust."] I intend to file *my own declaration*[ AND to help my [N] adult children make their own filings].

#v(3pt)
*Descent chain:* [ANCESTOR] -> [GENERATION 2] -> [APPLICANT] -> [DESCENDANTS].

#v(3pt)
I've assembled what I believe is a strong evidentiary chain and want your assessment on *whether it's sufficient to file*, the *best filing strategy*, and a short list of *mechanics questions* (below).

== 2. Evidence — held and pending

#text(weight: "bold", size: 12pt, fill: rgb("#333"))[A. Persecution & flight]
#evtable((
  ([[DOC A1]], [[WHAT A1 PROVES]], [*Exhibit 1*]),
  ([[DOC A2]], [[WHAT A2 PROVES]], [*Exhibit 2*]),
  ([[DOC A3 — pending]], [[WHAT A3 PROVES]], [_Ordered — pending_]),
))

#text(weight: "bold", size: 12pt, fill: rgb("#333"))[B. Family persecuted]
#evtable((
  ([[DOC B1]], [[WHAT B1 PROVES]], [*Exhibit 3*]),
))

#text(weight: "bold", size: 12pt, fill: rgb("#333"))[C. Origin / identity]
#evtable((
  ([[DOC C1]], [[WHAT C1 PROVES]], [*Exhibit 4*]),
  ([[DOC C2 — original pending]], [the original record behind Exhibit 4], [_in progress_]),
))

#text(weight: "bold", size: 12pt, fill: rgb("#333"))[D. Descent to me]
#evtable((
  ([[DOC D1]], [[WHAT D1 PROVES — the load-bearing descent link]], [*Exhibit 5*]),
  ([My + my descendants' birth certificates + apostilles], [applicant own-person documents], [_In progress_]),
  ([My + my descendants' apostilled background checks], [applicant own-person documents], [_In progress_]),
))

#text(weight: "bold", size: 12pt, fill: rgb("#333"))[E. Corroborating (optional — for the family archive)]
#evtable((
  ([[DOC E1]], [corroborates identity / refugee background], [_optional_]),
))

#pagebreak()
== 3. Questions for you — in priority order

#v(2pt)
+ *Is my chain already sufficient to file, or do I genuinely need [KEY PENDING DOC]?* Which documents are *actually required* vs. optional/for-family-history?

+ *Filing strategy for [N] applicants — the mechanics.* [Should we all file at the same time, or must my descendants wait for my own decision? What must each descendant's packet prove about the link from me to them? Should the declarations cross-reference each other?]

+ *Filing mechanics.* Is the process to complete the *online questionnaire*, then file the declaration form it generates, *including color printouts of all documents I hold*? Is that the whole mechanism?

+ *[EDGE-CASE QUESTION 1 — e.g. does a later conversion / a name variant / a name-change order affect eligibility?]*

+ *[EDGE-CASE QUESTION 2 specific to your applicants.]*

+ *Passports — originals vs. copies, and custody.* Must each applicant submit an *original passport*, or does a certified/color copy suffice? I'd prefer *not to mail originals* — does appearing in person to show-and-copy resolve it?

+ *What else should I do to maximize the chance of success and minimize the time the process takes?* Anything I haven't thought to ask.

// =====================================================================
// EXHIBITS  — one exhibit() cover block + one-or-more docpage() per exhibit.
// Repeat the block below for each exhibit; renumber and swap the placeholders.
// =====================================================================

#pagebreak()
#exhibit("1", "[EXHIBIT 1 TITLE]",
  [[SOURCE / REPOSITORY]],
  [[ARCHIVAL REFERENCE]],
  [[OBTAINED VIA — retrieval path]],
  [[URL or "not captured"]],
  [[WHY INCLUDED — the one §58c fact this proves]])
#docpage("exhibits/ex1-1.jpg", "[CAPTION — reference + what page]")
// #docpage("exhibits/ex1-2.jpg", "[CAPTION — page 2, e.g. reverse]")

#pagebreak()
#exhibit("2", "[EXHIBIT 2 TITLE]",
  [[SOURCE / REPOSITORY]],
  [[ARCHIVAL REFERENCE]],
  [[OBTAINED VIA]],
  [[URL or "not captured"]],
  [[WHY INCLUDED]])
#docpage("exhibits/ex2-1.jpg", "[CAPTION]")

#pagebreak()
#exhibit("3", "[EXHIBIT 3 TITLE]",
  [[SOURCE / REPOSITORY]],
  [[ARCHIVAL REFERENCE]],
  [[OBTAINED VIA]],
  [[URL or "not captured"]],
  [[WHY INCLUDED]])
#docpage("exhibits/ex3-1.jpg", "[CAPTION]")

// ... add further #exhibit(...) + #docpage(...) blocks as needed ...
