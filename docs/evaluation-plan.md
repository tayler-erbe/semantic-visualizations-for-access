# Evaluation plan: rules versus AI for accessible chart descriptions

**Goal:** measure, on real charts, how often each approach states something false, and how much of what blind readers value each one covers.

**Why this hasn't been done:** the four-level model paper (Lundgard and Satyanarayan, 2021) asks for automatic descriptions to be evaluated level by level. MATCHA (2026) measured LLM chart summaries with screen-reader users but notes that its drift metric does not check facts. Nobody has published a level-by-level, fact-checked comparison of a deployed rule-based system against LLM descriptions.

## Study 1. Four-level accuracy audit (no participants)

Full pre-registered protocol: [evaluation-protocol.md](evaluation-protocol.md).

**Charts.** 100 to 200 charts from the Legislative Intelligence Platform, covering bar, line and stacked charts.

**Conditions.**

| | Input | Output |
| --- | --- | --- |
| A | Chart image to an LLM | Description |
| B | Chart data to an LLM | Description |
| C | Rule-computed facts to an LLM | Rephrased description |
| D | Chart Details rules | Description, no AI |

Run A, B and C ten times per chart, with one frontier model, one open model (for example Qwen3-VL) and one small model.

**Answer key.** The facts the Chart Details rules compute: direction, highs and lows, biggest change, rank order, comparisons. Hand-check a random 30 charts first so the key itself is verified.

**Scoring.**

1. Split each description into sentences and label each Level 1 to 4. Calibrate the labeling against the four-level model's released corpus of 2,147 labeled sentences before trusting it.
2. Check every number, direction and extreme against the answer key automatically. Allowed rounding: within 2% (the rule the 2026 study used).
3. Flag Level 4 claims with no support in the data.

**Report.**

- Share of sentences that are factually correct, by condition and level
- Share of descriptions that are entirely correct
- Share of charts that get different facts across the 10 runs
- Level coverage: what share of each description is Level 1, 2, 3 and 4
- Cost and time per description

**The sentence this produces:** "On N charts, rules covered Levels 1 and 2 with zero factual errors and X% of Level 3. LLMs added more Level 3 and 4 content, but Y% of their sentences contained a factual error, and Z% of charts got different facts on different runs."

## Study 2. How much of what readers value can rules produce?

Using the released corpus (50 charts, 2,147 labeled sentences written by people), write rules for each chart and measure what share of the Level 1, 2 and 3 sentences the rules can reproduce. This shows how far rules reach toward the content blind readers ranked most useful, and which Level 3 rules to add next (for example "rose steadily, then leveled off").

## Study 3. Screen-reader user study (later)

Follow the Sharif (2021) and MATCHA (2026) designs. The same chart questions answered with Chart Details, with an LLM summary, and with both. Measure accuracy, time, confidence and trust. Compare against MATCHA's 55% accuracy and Sharif's baseline (61% less accurate, 211% more time). Partner with Disability Resources and Educational Services; get IRB approval before publishing.

## Feature to test alongside

Let readers choose a short overview or a detailed breakdown. Both the four-level paper (40% of blind readers want combined levels) and MATCHA (adaptive detail) support it.
