# arXiv package inventory

**Status:** BLOCKED — `dist/arxiv_source_v1.zip` does not exist because the local Python and TeX toolchain is unavailable. This file is intentionally a pending inventory, not evidence of a package.

When `make package` completes successfully, `scripts/package_release.sh` replaces this template with the exact size and SHA-256 for every member after it verifies the ZIP has **only** the following entries:

| File | Size | SHA-256 | Reason required | Classification |
| --- | ---: | --- | --- | --- |
| `main.tex` | pending | pending | top-level arXiv compilation entry point | generated wrapper |
| `content.tex` | pending | pending | shared scientific body | authored source |
| `main.bbl` | pending | pending | compatible resolved bibliography | generated build output |
| `references.bib` | pending | pending | bibliography source/provenance | authored source |
| `figures/figure_1_concentration_is_not_scaling.pdf` | pending | pending | PDFLaTeX figure required by content | generated figure |
| `figures/figure_2_exact_component_attribution.pdf` | pending | pending | PDFLaTeX figure required by content | generated figure |

The packaging script rejects any additional or missing member before clean extracted-package compilation. In particular, it rejects Git metadata, notes, reports, Python, CSVs, tests, manuscript variants, Elsevier assets, logs, and auxiliary files other than `main.bbl`.
