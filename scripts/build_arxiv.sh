#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$root"
PYTHONPATH=src python scripts/generate_demo.py
mkdir -p dist
rm -f dist/manuscript_arxiv_v1.pdf
(
  cd paper
  TEXINPUTS="$PWD//:${TEXINPUTS:-}" latexmk -pdf -halt-on-error -file-line-error -outdir="$root/dist" arxiv.tex
)
log=dist/arxiv.log
if rg -n 'LaTeX Warning: (Reference|Citation) .* undefined|There were undefined references|undefined citations' "$log"; then
  echo 'arXiv build has undefined references or citations.' >&2
  exit 1
fi
mv dist/arxiv.pdf dist/manuscript_arxiv_v1.pdf
