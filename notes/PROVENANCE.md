# Provenance

This repository is a paper-specific extraction from:

- Source repository: `matuteiglesias/French_exporters`
- Local source path: `/home/matias/repos/French_exporters`
- Source branch: `master`
- Source commit: `94e557277aae427e9500724d6d56e9591045e4c1`
- Migration date: 2026-07-24

The source repository retains the broader thesis, empirical data
lineage, notebooks, and research programme.

This repository contains only the formal paper, its deterministic
analytic verification, tests, manuscript sources, and publication
assets.

The commits in this repository organize the migrated snapshot into
logical scientific and software units. They do not reconstruct or
replace the original development history preserved in the source
repository.

## Structural migration map

- `paper/variance_scaling_note/manuscript.tex` → `paper/content.tex`, `paper/arxiv.tex`, and `paper/elsevier.tex`; the shared scientific body is in `content.tex`.
- `paper/variance_scaling_note/references.bib` → `paper/references.bib` unchanged.
- `paper/variance_scaling_note/cas-*` → `paper/styles/elsevier/`.
- `research/demos/variance_scaling_identity_demo.py` → `scripts/generate_demo.py`.
- `research/artifacts/variance_scaling_demo_v0_2/` → `artifacts/reference/variance_scaling_demo_v0_2/`.

CSV and Markdown files in the reference artifact are generated/reproducibility evidence. PNG review figures and all PDF/ZIP outputs are generated locally and intentionally excluded from Git. Primary scientific source remains the migrated TeX and bibliography files.

The former `paper/variance_scaling_note/supplement/` held only a generic requirements list and placeholder README; it had no paper-specific source content and was removed rather than migrated. The former v0.2 PNG files were generated review outputs and are deliberately not versioned; `scripts/generate_demo.py` recreates them when required for a build.
