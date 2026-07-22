# Austrian Citizenship via §58c StbG — a research & document-assembly kit

> ### 🚧 Status: In Review
> **This is a work in progress, shared early on purpose.** I'm in the middle of my own §58c
> application. I found [Claude](https://claude.com/claude-code) genuinely helpful for the research
> and document work, and I'm trying to turn what I've done into a **reusable skill** other applicants
> can use for their own families. It's not finished or authoritative yet — I'm putting it out to
> find collaborators and reviewers. **If you've been through this, or are going through it now:
> corrections, additions, and second opinions are hugely welcome.** Open an issue, open a PR, or just
> comment. Let's build the guide we all wish we'd had.

A practical, reusable kit for pursuing **Austrian citizenship under §58c** of the Austrian
Citizenship Act — the route for **direct descendants of people persecuted by the Nazi regime** to
reclaim Austrian (and therefore EU) citizenship. No generational cap; dual citizenship allowed.

It was built from one family's real, successful research process and generalized so anyone can run
it for their own ancestor. All personal case data has been removed; the worked example is an
anonymized composite.

## Start here

- **Not a programmer? → [`GUIDE.md`](GUIDE.md)** — a complete, plain-language how-to you can read
  start to finish. Everything you need is in there, no tools required.
- **Use [Claude Code](https://claude.com/claude-code)? → [`SKILL.md`](SKILL.md)** — the installable
  skill. Point Claude at this folder and it can drive logged-in archives in a browser, organize your
  evidence, draft your records-request emails, and render the final consulate/attorney-ready PDF.

## What's inside

| File | What's in it |
|---|---|
| [`GUIDE.md`](GUIDE.md) | Plain-language standalone guide — start here |
| [`SKILL.md`](SKILL.md) | Installable Claude Code skill (entry point + workflow) |
| `reference/01-eligibility-and-process.md` | Who qualifies · where/how to file · fees · questionnaire · document checklist |
| `reference/02-source-playbook.md` | Every archive: what it holds, URL, how to search — core sources + by destination country |
| `reference/03-email-request-templates.md` | Ready-to-send, fill-in-the-blank records-request emails |
| `reference/04-browser-automation.md` | Driving logged-in archive sites (Claude Code) |
| `reference/05-evidence-and-briefing-pipeline.md` | Evidence register + how to build the briefing |
| `reference/06-render-pipeline.md` | Rendering the final briefing + exhibits PDF (Typst) |
| `reference/07-firms-vs-diy.md` | Vetting an attorney vs. DIY |
| `reference/08-applicant-gotchas.md` | MA35 realities, apostille/criminal-record/translation mechanics, traps |
| `examples/worked-example-anonymized.md` | The whole method walked end-to-end on a composite case |
| `scripts/` | Typst template + build script for the exhibit-bundle PDF |

## Not legal advice

This is a research and document-organization aid written by a fellow applicant, not an attorney.
§58c is a *declaration*, not a discretionary application, and you are **not required to hire a
lawyer** — but for a hard case, confirm specifics with your competent Austrian consulate or an
Austrian attorney. Laws, fees, and office practices change; **verify the load-bearing facts against
official sources** ([oesterreich.gv.at](https://www.oesterreich.gv.at),
[bmeia.gv.at](https://www.bmeia.gv.at), and your consulate's own §58c page) before you rely on them.

## Related / complementary tools

This kit is **§58c-specific** — the Austrian persecution archives, the records-request
mechanics, and the consulate/MA35 filing. For the general work of **building and
proving the family tree itself**, these open-source genealogy skills pair well: use
theirs to construct and prove the descent chain, then use this kit for the §58c
archives, requests, and filing.

- **[genealogy-research](https://github.com/sliday/genealogy-research)** (MIT) —
  systematic genealogy research using the Genealogical Proof Standard, with a
  region-by-region database catalog and multilingual historical-document analysis.
- **[claude-family-history-research-skill](https://github.com/emaynard/claude-family-history-research-skill)**
  (MIT) — research planning built on the Genealogical Proof Standard, *Evidence
  Explained* citations, and research logs.

## Contributing

This is **in review** and I'd love help making it better — especially from people who've actually
been through §58c. Useful contributions:
- **Corrections** — anything factually off, out of date, or that didn't match your experience.
- **Additions** — an archive or record source I missed, a destination country under-covered, a
  consulate's current practice.
- **Second opinions** — where the guidance is too confident or too cautious.

Open an [issue](../../issues) or a PR, or just leave a comment. Please **don't put anyone's personal
case data** (names, reference numbers) in issues/PRs — keep examples generic.

## Sharing & license

**Freely shareable** — pass it around your family, your genealogy group, or fellow applicants.
Released into the public domain under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/).
If you improve it, please pass the improved version on. Good luck. 🕯️
