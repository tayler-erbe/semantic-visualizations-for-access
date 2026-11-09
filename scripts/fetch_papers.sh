#!/usr/bin/env bash
# Downloads the papers this repo links to but cannot redistribute (arXiv default
# license, ACM or IEEE copyright) into research/papers-local/, which git ignores.
# Run from the repo root: bash scripts/fetch_papers.sh
set -euo pipefail
out="research/papers-local"
mkdir -p "$out"

fetch() {
  local name="$1" url="$2"
  if [ -s "$out/$name" ]; then
    echo "have   $name"
  else
    echo "fetch  $name"
    curl -fsSL --retry 2 -o "$out/$name" "$url" || echo "FAILED $name ($url)"
  fi
}

fetch lundgard-satyanarayan-2021-four-level-model.pdf  https://vis.mit.edu/pubs/vis-text-model.pdf
fetch sharif-assets2021-screen-reader-experiences.pdf    https://faculty.washington.edu/wobbrock/pubs/assets-21.01.pdf
fetch sharif-assets2022-geospatial.pdf                   https://faculty.washington.edu/wobbrock/pubs/assets-22.02.pdf
fetch olli-blanco-2022.pdf                               https://vis.csail.mit.edu/pubs/olli.pdf
fetch arxiv-2205.04917-zong-rich-screen-reader-experiences.pdf https://arxiv.org/pdf/2205.04917
fetch arxiv-2307.05356-vistext.pdf                       https://arxiv.org/pdf/2307.05356
fetch arxiv-2505.13444-chartmuseum.pdf                   https://arxiv.org/pdf/2505.13444
fetch arxiv-2607.25021-chart-supported-or-model-supplied.pdf https://arxiv.org/pdf/2607.25021
fetch arxiv-2604.15597-llms-corrupt-documents.pdf        https://arxiv.org/pdf/2604.15597
fetch arxiv-2604.25149-semantic-layers-benchmark.pdf     https://arxiv.org/pdf/2604.25149

data="research/datasets-local/four-level-model"
mkdir -p "$data"
for f in corpus_sentences_labeled.json vis-text-model.README.md vis-text-model.SUMMARY.txt; do
  [ -s "$data/$f" ] || curl -fsSL -o "$data/$f" "https://vis.csail.mit.edu/pubs/vis-text-model/data/$f" || echo "FAILED $f"
done
echo "Done. Files are in $out and $data (not tracked by git)."
