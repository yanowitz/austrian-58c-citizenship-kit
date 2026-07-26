# Running skill-creator for this repo

This repo is set up to use the `skill-creator` workflow for drafting and testing `SKILL.md`. Read about skill-creator at [anthropics/skills skill-creator](https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md).

## 1. Edit the skill

- Update `SKILL.md` for behavior or trigger changes.
- Update `evals/evals.json` when you want to add or refine test prompts.
- Keep eval prompts anonymized and focused on realistic user scenarios.

## 2. Run the evals

From the `skill-creator` package directory:

```bash
cd <path-to-skill-creator>
python3 -m scripts.aggregate_benchmark \
  <path-to-workspace>/iteration-1 \
  --skill-name austrian-58c-citizenship
```

To generate the reviewer HTML:

```bash
python3 eval-viewer/generate_review.py \
  <path-to-workspace>/iteration-1 \
  --skill-name austrian-58c-citizenship \
  --benchmark <path-to-workspace>/iteration-1/benchmark.json \
  --static <path-to-workspace>/iteration-1/review.html
```

## 3. What to look at

- **Outputs tab**: compare the with-skill and baseline answers for each eval.
- **Benchmark tab**: check pass rate, time, and token usage.
- **Eval 5** is a good sanity check for whether the skill separates documented facts from inferences.

## 4. Iteration workflow

1. Update the skill or evals.
2. Rerun the relevant iteration in a fresh workspace.
3. Regenerate the benchmark and review HTML.
4. Fold in user feedback and repeat.

## Learn more
