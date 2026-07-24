#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$root"
PYTHONPATH=src python scripts/generate_demo.py
mkdir -p dist
rm -f dist/manuscript_elsevier.pdf
(
  cd paper
  TEXINPUTS="$PWD/styles/elsevier//:$PWD//:${TEXINPUTS:-}" BSTINPUTS="$PWD/styles/elsevier//:$PWD//:${BSTINPUTS:-}" latexmk -pdf -halt-on-error -file-line-error -outdir="$root/dist" elsevier.tex
)
log=dist/elsevier.log
if rg -n 'LaTeX Warning: (Reference|Citation) .* undefined|There were undefined references|undefined citations' "$log"; then
  echo 'Elsevier build has undefined references or citations.' >&2
  exit 1
fi
mv dist/elsevier.pdf dist/manuscript_elsevier.pdf
