# Release baseline

- **Starting commit:** `29530a2` (`refactor: add twin manuscript build structure`).
- **Starting branch:** `work`; the release branch was created from this clean commit as `release/arxiv-v1-readiness`.
- **Working tree at baseline:** clean (`git status --short --branch` reported only `## work`).
- **Python:** `/root/.pyenv/shims/python`, Python 3.14.4; no active virtual environment (`VIRTUAL_ENV` unset).
- **Installed Python tooling:** `pytest 9.0.3`; project runtime dependencies (`numpy`, `pandas`, `matplotlib`) were not installed. Installed versions: `black 26.3.1`, `click 8.3.3`, `iniconfig 2.3.0`, `isort 8.0.1`, `librt 0.9.0`, `mypy 1.20.2`, `mypy_extensions 1.1.0`, `nodeenv 1.10.0`, `packaging 26.2`, `pathspec 1.1.0`, `pip 26.1`, `platformdirs 4.9.6`, `pluggy 1.6.0`, `Pygments 2.20.0`, `pyright 1.1.409`, `pytest 9.0.3`, `pytokens 0.4.1`, `ruff 0.15.12`, and `typing_extensions 4.15.0`.
- **TeX/PDF tooling:** `latexmk`, `pdflatex`, `bibtex`, `texcount`, `pdfinfo`, and `pdftoppm` were absent from `PATH`.
- **Manuscript citation keys in use:** `gabaix2011` (one `\citep` call). The bibliography contains additional records, but no bibliography repair was performed at baseline.
- **Existing build products:** no `dist/` PDFs existed, so page and word counts were unavailable.
- **Current build blockers:** missing Python runtime dependencies prevent the deterministic demo and tests; missing TeX/PDF tools prevent compilation, package validation, page counting, and PDF metadata inspection.
- **Figure-generation path:** `scripts/generate_demo.py` writes PNG review figures to `artifacts/reference/variance_scaling_demo_v0_2/` and mirrors them to ignored `paper/figures/`; `paper/content.tex` includes the mirrored `figures/figure_1_concentration_is_not_scaling.png` and `figures/figure_2_exact_component_attribution.png`.

This baseline is an environment observation, not evidence that the manuscript or numerical artifact has passed release validation.
