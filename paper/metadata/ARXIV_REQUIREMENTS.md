# arXiv requirements (confirmation pending)

**Access date:** 2026-07-24.

## Official sources required for final confirmation

- <https://info.arxiv.org/help/submit/index.html>
- <https://info.arxiv.org/help/submit_tex.html>
- <https://info.arxiv.org/help/prep.html>
- <https://info.arxiv.org/help/license/index.html>
- <https://info.arxiv.org/help/endorsement.html>
- <https://arxiv.org/category_taxonomy>

The release environment could not retrieve these pages: the documentation request returned HTTP 401 through the browsing service and direct `curl` requests failed with `CONNECT tunnel failed, response 403`. The requirements below are therefore a **pending-confirmation checklist** based on the PI-provided release contract, not a claim that the current official pages were successfully inspected.

## Submission-system checklist

The upload must be a source submission, not a locally compiled PDF alone. The ZIP root must contain a top-level `main.tex` with its own `\documentclass`; it must compile from an empty temporary directory using only packaged files. Paths must be relative and case-exact, filenames must use arXiv-permitted characters, and no parent-directory, absolute-path, shell-escape, remote-URL, JavaScript, executable, hidden, or extraneous-file dependency may remain.

The planned package contains `main.tex`, `content.tex`, `main.bbl`, `references.bib`, and two PDF figures. It excludes the Elsevier class, publisher branding, Git metadata, notes, reports, Python, CSVs, tests, old manuscript variants, logs, and auxiliary files other than `main.bbl`. PDF metadata must be reviewed to ensure it exposes no private filesystem path.

PDFLaTeX-compatible figures must be present and referenced with exact case. The package route is `pdflatex -interaction=nonstopmode -halt-on-error main.tex`, with the compatible generated `main.bbl` included rather than requiring a remote bibliography step.

## Outstanding official checks

Before upload, the PI must re-open the official pages above from a networked browser and confirm the current arXiv TeX Live version, filename policy, license wording, and any submission-system changes. The package is not approved for upload until that check and the clean extracted build pass.
