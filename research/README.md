# Research library

The studies behind *Charts Without Guesswork*. Collected and reviewed November 2026.

**Status:** Read = read in full, numbers checked against the paper. Skimmed = abstract, results and limits checked. Filed = collected, not yet reviewed.

**In repo:** papers whose license allows redistribution are in [`papers/`](papers/). The rest are linked. Run `bash scripts/fetch_papers.sh` from the repo root to download them to `research/papers-local/` for your own use (git ignores that folder).

## 1. What blind and low-vision readers need

| Paper | Year · venue | Key finding | Status | Copy |
| --- | --- | --- | --- | --- |
| [Accessible Visualization via Natural Language Descriptions: A Four-Level Model of Semantic Content](https://vis.mit.edu/pubs/vis-text-model.pdf) (Lundgard, Satyanarayan) | 2021 · IEEE VIS / TVCG | 30 blind and 90 sighted readers. Blind readers want straight facts, not editorializing; 40% want descriptions that combine levels. Levels 1 and 2 are computable from the data | Read | Link (IEEE) |
| [Understanding Screen-Reader Users' Experiences with Online Data Visualizations](https://faculty.washington.edu/wobbrock/pubs/assets-21.01.pdf) (Sharif et al.) | 2021 · ASSETS | Screen-reader users were 61.48% less accurate and took 210.96% more time than other users (36 vs 36 participants) | Skimmed | Link (ACM) |
| [Communicating Visualizations without Visuals](https://arxiv.org/abs/2108.03657) (Jung et al.) | 2022 · TVCG | 22 people with visual impairments; alt-text guidelines call for chart type, axes, data points and trends, but rest on little evidence | Skimmed | [In repo](papers/arxiv-2108.03657-jung-alt-text-for-visualizations.pdf) (CC BY-NC-ND) |
| [Rich Screen Reader Experiences for Accessible Data Visualization](https://arxiv.org/abs/2205.04917) (Zong et al.) | 2022 · EuroVis | 13 blind or low-vision users; hierarchy, cursors and roadmaps help | Filed | Link |
| [Olli: An Extensible Visualization Library for Screen Reader Accessibility](https://vis.csail.mit.edu/pubs/olli.pdf) (Blanco et al.) | 2022 · IEEE VIS | Open-source library that turns charts into keyboard-navigable structures | Filed | Link |
| VoxLens: Making Online Data Visualizations Accessible (Sharif et al.) | 2022 · CHI | Screen-reader users 122% more accurate and 36% faster with a data-driven tool | Filed | [In repo](papers/sharif-chi2022-voxlens.pdf) (CC BY) |
| [Understanding and Improving Information Extraction from Online Geospatial Data Visualizations](https://faculty.washington.edu/wobbrock/pubs/assets-22.02.pdf) (Sharif et al.) | 2022 · ASSETS | Follow-on study for maps | Filed | Link (ACM) |
| MATCHA: LLM-Based Chart Summarization for Screen Reader Users (Kahn et al.) | 2026 · ACL NLP4PI | 126 participants. Optimized LLM summaries plus Q&A raised task accuracy from 29.17% to 55.00%. Their drift metric does not check facts | Skimmed | [In repo](papers/acl-nlp4pi2026-matcha-llm-chart-summaries.pdf) (CC BY) |
| [Touching or Chatting](https://arxiv.org/abs/2607.23065) (He et al.) | 2026 · arXiv | 12 BLV participants; text plus an LLM was weak on spatial reasoning; tactile models helped | Skimmed | [In repo](papers/arxiv-2607.23065-touching-or-chatting.pdf) (CC BY) |

## 2. How accurate AI is about charts

| Paper | Year · venue | Key finding | Status | Copy |
| --- | --- | --- | --- | --- |
| [Chart-Supported or Model-Supplied?](https://arxiv.org/abs/2607.25021) (Eliza et al.) | 2026 · arXiv | GPT-5.4, Gemini, Llama on 102 charts: ~77.5% of "direct" numbers matched the data (pooled with and without the data table); adding the table helped 2 to 7 points | Read | Link |
| [Do LVLMs Understand Charts? (CHOCOLATE)](https://arxiv.org/abs/2312.10160) (Huang et al.) | 2024 · ACL Findings | 82% of AI chart captions had at least one factual error | Read | [In repo](papers/arxiv-2312.10160-chocolate.pdf) (CC BY) |
| [ChartMuseum](https://arxiv.org/abs/2505.13444) (Tang et al.) | 2025 · NeurIPS | Best model 63% vs people 93%; accuracy collapses on cluttered charts | Read | Link |
| [VisText](https://arxiv.org/abs/2307.05356) (Tang, Boggust, Satyanarayan) | 2023 · ACL | Captions generated from data tables and scene graphs; six error categories | Filed | Link |
| [Chart-to-Text](https://arxiv.org/abs/2203.06486) (Kantharaj et al.) | 2022 · ACL | Models still hallucinate with the data table supplied | Filed | [In repo](papers/arxiv-2203.06486-chart-to-text.pdf) (CC BY) |
| [CharXiv](https://arxiv.org/abs/2406.18521) (Wang et al.) | 2024 · NeurIPS | People 80.5%; context for easy benchmarks | Filed | [In repo](papers/arxiv-2406.18521-charxiv.pdf) (CC BY-SA) |
| [ChartQAPro](https://arxiv.org/abs/2504.05506) (Masry et al.) | 2025 · arXiv | Same model 90.5% on ChartQA, 55.8% on ChartQAPro | Filed | [In repo](papers/arxiv-2504.05506-chartqapro.pdf) (CC BY) |
| [CaTS-Bench](https://arxiv.org/abs/2509.20823) | 2025 · arXiv | Models miss numeric nuance when describing time series | Filed | [In repo](papers/arxiv-2509.20823-cats-bench.pdf) (CC BY) |

## 3. Rules versus AI, and reliability

| Paper | Year · venue | Key finding | Status | Copy |
| --- | --- | --- | --- | --- |
| [Differences in Semantic Errors Made by Different Types of Data-to-text Systems](https://aclanthology.org/2024.inlg-main.47) (Huidrom, Belz, Lorandi) | 2024 · INLG | Rule systems made fewer meaning errors than neural and LLM systems | Read | [In repo](papers/inlg2024-semantic-errors-data-to-text.pdf) (CC BY) |
| [LLMs Corrupt Your Documents When You Delegate](https://arxiv.org/abs/2604.15597) (Laban, Schnabel, Neville) | 2026 · Microsoft Research | Frontier models lost 25% of content over 20 edits | Read | Link |
| [Don't Let AI Agents YOLO Your Files](https://arxiv.org/abs/2604.13536) | 2026 · arXiv | Undo and inspection belong in the system, not the agent | Filed | [In repo](papers/arxiv-2604.13536-agents-yolo-files.pdf) (CC BY) |

## 4. Data readiness and semantic layers

| Paper | Year · venue | Key finding | Status | Copy |
| --- | --- | --- | --- | --- |
| [Semantic Layers for Reliable LLM-Powered Data Analytics](https://arxiv.org/abs/2604.25149) | 2026 · arXiv | A semantic layer reportedly adds 17 to 23 points of first-shot accuracy | Filed | Link |
| [Pervasive Annotation Errors Break Text-to-SQL Benchmarks and Leaderboards](https://arxiv.org/abs/2601.08778) | 2026 · arXiv | 52.8% and 62.8% annotation errors in BIRD Mini-Dev and Spider 2.0-Snow | Filed | [In repo](papers/arxiv-2601.08778-text-to-sql-annotation-errors.pdf) (CC BY) |

## Dataset

Lundgard and Satyanarayan released their corpus: 582 descriptions of 50 charts, with 2,147 sentences each labeled Level 1 to 4. It is the answer key for scoring descriptions by level. Source: <https://vis.csail.mit.edu/pubs/vis-text-model/data/>. The fetch script downloads it to `research/datasets-local/`.

## Still to get

- Chart Reader (Thompson et al., CHI 2023) and MAIDR (Seo et al., CHI 2024).
- InsightBench and DataBench (SemEval-2025 Task 8): LLM accuracy on insights and questions over real tables.
- Kim et al., "Accessible Visualization: Design Space, Opportunities, and Challenges" (EuroVis 2021).
