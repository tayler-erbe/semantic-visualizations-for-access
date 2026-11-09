# Evaluation protocol: rule-based versus AI chart descriptions

**Question:** on our own charts, how often does each way of describing a chart state something false, how consistent is it, and how much of what readers need does it cover?

**Why it matters:** published benchmarks use other people's charts and single questions. No one has measured a deployed rule-based description system against AI descriptions, sentence by sentence, on the same charts. This produces the number the brief can't yet give: Chart Details' own accuracy.

Status: draft protocol, November 2026. Hypotheses, thresholds and scoring are frozen before any test-set run.

## 1. Research questions

| ID | Question |
| --- | --- |
| RQ1 | What share of factual statements is correct in each condition? |
| RQ2 | How often does the same chart get different facts across repeated runs? |
| RQ3 | Which levels of content (four-level model) does each condition cover, and how often does it add unsupported interpretation? |
| RQ4 | Does giving a model the data instead of the image improve accuracy on our charts? |
| RQ5 | What does each condition cost and how long does it take per chart? |

## 2. Pre-registered hypotheses and pass bars

| ID | Hypothesis | Pass bar |
| --- | --- | --- |
| H1 | Chart Details is factually correct | ≥ 99% of factual statements correct, lower 95% confidence bound ≥ 98% |
| H2 | Every AI condition is less accurate than Chart Details | Paired comparison per chart, p < 0.05 |
| H3 | AI descriptions vary between runs; Chart Details does not | AI: share of charts with any fact differing across 5 runs > 0; rules: exactly 0 |
| H4 | Data beats image for AI | Statement accuracy, data-only > image-only, paired p < 0.05 |
| H5 | Rules plus an AI rephrase, with a number checker, matches rules on accuracy | Within 1 point of H1, no unflagged numeric errors |

If H1 fails, the rules are fixed and re-tested on a **new** held-out set, and both results are reported.

## 3. Charts

- **Source:** the Legislative Intelligence Platform. The data is public legislative data, so cloud models are allowed.
- **Sample:** 120 charts, stratified by type (bar, line, stacked or grouped bar, other) and complexity (1 series, 2 to 4, 5 or more).
- **Split:** 20 development charts to build prompts and the scorer; **100 test charts frozen** and untouched until the final run.
- **Calibration set:** the four-level model corpus (50 charts, 2,147 labeled sentences) for training and checking level labeling only.

## 4. Conditions

| ID | Input | Writer | Notes |
| --- | --- | --- | --- |
| R | Chart data | Chart Details rules | The system under test |
| A1 | Chart image | AI model | What most "AI alt text" does |
| A2 | Data table | AI model | Same data the rules get |
| A3 | Image plus data table | AI model | Replicates the 2026 study design |
| A4 | Facts computed by the rules | AI model rephrases | The "assist layer," followed by an automatic number check |

## 5. Models

Pinned by version string and date; run at temperature 0, plus default temperature for the consistency test.

| Role | Candidate | Runs where |
| --- | --- | --- |
| Frontier, closed | One current model available through Azure (record exact version) | Azure |
| Open, vision | Qwen3-VL 8B, and 32B if hardware allows (used in the OCR evaluation) | Local GPU |
| Open, text | gpt-oss-20b (A2 and A4 only) | Local GPU |

**Prompt:** one frozen instruction for every model and condition. Describe the chart objectively, in plain language, for a reader who can't see it; cover the overall trend, highest and lowest values, the biggest change, and key comparisons; don't interpret causes. Stored in `eval/prompts/`.

**Runs:** 5 per chart, condition and model. Test set: 100 charts × 4 AI conditions × up to 3 models × 5 runs ≈ 6,000 descriptions, plus 100 rule descriptions.

## 6. Answer key

The answer key is a **fact sheet** per chart, computed from the data by an **independent script**, not by Chart Details' code, so the rules aren't graded against themselves. It lists: every value, the maximum and minimum, direction of change per series, the largest change, rank order, and pairwise comparisons.

Two people hand-check the fact sheets for 30 test charts before scoring starts. Any disagreement with the script is resolved and logged.

## 7. Scoring

No model grades another model's output for the main measures.

1. **Split** each description into sentences, then into atomic claims of fixed types: value, extreme, direction, comparison, change, rank, count, encoding (title, axes, units).
2. **Numeric claims:** checked automatically against the fact sheet. A number is correct if it matches at the chart's displayed precision, or within 2% where the description rounds.
3. **Non-numeric claims** (direction, comparison, rank): checked automatically where a lexicon and the fact sheet decide it; otherwise by two human annotators on a 30-chart subset of every condition, with agreement reported (Cohen's kappa ≥ 0.7 required).
4. **Unsupported claims:** statements about causes or context not in the data are flagged as Level 4 and counted separately, not as errors.
5. **Levels:** each sentence labeled Level 1 to 4 using the four-level model's codebook. Annotators first label the calibration corpus and must reach kappa ≥ 0.7 against the published labels.
6. **Coverage:** share of required facts (trend, highest, lowest, biggest change) each description states.

## 8. Measures and statistics

| Measure | Definition |
| --- | --- |
| Statement accuracy | Correct factual claims ÷ all factual claims |
| Fully correct descriptions | Descriptions with zero false claims |
| Unsupported claim rate | Level 4 claims with no basis in the data ÷ all claims |
| Run-to-run disagreement | Charts where any fact differs across the 5 runs |
| Required-fact coverage | Required facts stated ÷ required facts |
| Level mix | Share of sentences at each level |
| Readability | Flesch-Kincaid grade |
| Cost and time | Per 1,000 descriptions; local runs report GPU time, not dollars |

Confidence intervals: Wilson for proportions, bootstrap over charts for statement accuracy. Paired tests per chart: McNemar for fully correct descriptions, paired bootstrap for statement accuracy.

## 9. Timeline

| Week | Work |
| --- | --- |
| 1 | Pull 120 charts with data; build the independent fact-sheet script; freeze the split |
| 2 | Write and freeze the prompt; build the scorer on the 20 development charts; calibrate level annotators |
| 3 | Hand-check 30 fact sheets; run all conditions on the test set |
| 4 | Score, annotate the subset, analyze, write the report; update the brief with our own numbers |

## 10. Outputs

- `eval/results/` — every description, claim and score, with source hashes
- A short report in the brief's design: headline numbers per condition, the paired comparisons, examples of errors
- One line for the brief and LinkedIn, for example: "Across 100 of our charts, Chart Details stated X of Y facts correctly. The best AI condition stated Z%."

## 11. Repository layout

```
eval/
  charts/        chart data and images (dev/, test/)
  factsheets/    independent answer keys
  prompts/       frozen prompts
  runs/          raw model outputs
  scorer/        claim extraction and checking
  annotations/   human labels and agreement
  results/       scored outputs and report data
```

## 12. Open items

- How many charts the platform has, and how to export each chart's data with its image
- Which frontier model is available in our Azure tenant
- Two annotators for the hand checks and level labels
- GPU time on the local workstation
