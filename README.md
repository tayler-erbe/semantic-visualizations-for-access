# Semantic Visualizations for Access

If you have the data behind a chart, describe the chart from the data, not from a picture of it.

I built accessible chart descriptions for the Legislative Intelligence Platform. My first version used AI. I rebuilt it so every description is calculated by rules from the chart's own data, next to an accessible data table and an Excel download. This repo holds the research that backs that decision, the brief I wrote from it, and the plan to measure it on real charts.

**Tayler Erbe** · Data Scientist, AI Solutions Team, University of Illinois System · Document Intelligence Lab

## What the research shows

- **AI still gets chart facts wrong.** In a 2026 study, about 1 in 5 numbers that GPT-5.4 and Gemini called directly supported didn't match the data. Giving them the data table helped by only 2 to 7 points.
- **Most AI captions contain an error.** People checked 1,187 AI chart captions; 82% had at least one factual error (2023-era models).
- **Hard and busy charts break AI.** On realistic chart questions, the best model scored 63% and people scored 93%. With nine overlaid histograms, the model was right about 6% of the time.
- **Blind readers want facts.** In the four-level model study, most blind readers wanted straight facts about the data. Those facts are exactly what code computes reliably.
- **Screen-reader users still struggle.** They were 61% less accurate and took 211% more time with typical online charts. The best LLM summarizer tested so far raised task accuracy to 55%.

Full numbers, limits and sources are in the [brief](brief/index.html) and the [research library](research/README.md).

## What's here

| Folder | Contents |
| --- | --- |
| [`brief/`](brief/) | *Charts Without Guesswork*, a two-page brief in the Document Intelligence Lab design (same stylesheets as test-ocr-work): findings, ChartMuseum charts, comparison, best practice, evidence |
| [`research/`](research/) | Catalog of 22 papers by topic, with status and key findings. Papers that allow redistribution are in `research/papers/` |
| [`docs/evaluation-plan.md`](docs/evaluation-plan.md) | How to measure rules against AI on real charts, level by level |
| [`scripts/fetch_papers.sh`](scripts/fetch_papers.sh) | Downloads the linked papers and the four-level dataset for local use |
| [`scripts/build_artifact.py`](scripts/build_artifact.py) | Builds single-file copies of the brief with CSS and JS inlined |

## Viewing the brief

Turn on GitHub Pages for this repo (Settings, Pages, deploy from the `main` branch, root folder). The brief will be at `/brief/`. Or open `brief/index.html` in a browser.

## Licensing

Papers in `research/papers/` are included under their Creative Commons or ACL Anthology licenses, noted in the catalog. Papers under arXiv's default license, ACM or IEEE copyright are linked, not copied. My own writing and code in this repo are mine; ask before reusing.
