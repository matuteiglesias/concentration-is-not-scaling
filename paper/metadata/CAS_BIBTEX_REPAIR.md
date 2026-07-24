# CAS BibTeX repair task specification

```yaml
target_artifact: Elsevier CAS manuscript build and source package
permitted_paths:
  - scripts/build_elsevier.sh
  - scripts/package_release.sh
  - paper/metadata/CAS_BIBTEX_REPAIR.md
frozen_scientific_meaning: No changes to paper/content.tex scientific prose, citations, equations, figures, title, abstract, or numerical content.
inputs:
  - paper/elsevier.tex
  - paper/content.tex
  - paper/references.bib
  - paper/styles/elsevier/cas-model2-names.bst
expected_outputs:
  - dist/manuscript_elsevier.pdf
  - dist/elsevier.bbl
  - dist/elsevier_submission_source.zip
validation_command:
  - make elsevier
  - make arxiv
  - make package
forbidden_changes:
  - no scientific rewriting
  - no citation-key changes
  - no equation, figure, title, abstract, or numerical-content changes
  - no generated PDF, PNG, or ZIP binaries committed
stop_condition: make elsevier completes with no undefined citations/references, or the first local environment/toolchain blocker is recorded.
```

## Failure analyzed

The reported Elsevier run reaches BibTeX after the first PDFLaTeX pass, but BibTeX cannot open the requested bibliography style file. The downstream undefined `gabaix2011` citation and equation/figure references are first-pass symptoms that cannot resolve once BibTeX stops before producing `elsevier.bbl`.

## Mechanical repair

The build now exports both `TEXINPUTS` and `BSTINPUTS` with `paper/styles/elsevier//` before invoking `latexmk`, so CAS classes and CAS bibliography styles are discoverable by TeX and BibTeX from the clean `dist/` output directory. The Elsevier source package also includes a `latexmkrc` that sets those same search paths inside a freshly extracted package.

## Abstract layout follow-up

```yaml
target_artifact: Elsevier CAS first-page title, abstract, and keyword layout
permitted_paths:
  - paper/abstract.tex
  - paper/arxiv.tex
  - paper/content.tex
  - paper/elsevier.tex
  - scripts/package_release.sh
  - paper/metadata/CAS_BIBTEX_REPAIR.md
frozen_scientific_meaning: All scientific wording, citations, equations, figures, title, abstract text, keywords, highlights, and numerical content.
inputs:
  - reported first-page rendering
  - paper/styles/elsevier/cas-common.sty
  - paper/styles/elsevier/cas-dc.cls
  - CAS manuscript at commit feb1327
expected_outputs:
  - populated CAS abstract column with no keyword/body overlap
  - unchanged arXiv scientific rendering
  - self-contained extracted source packages
validation_command: make elsevier && make arxiv && make package
forbidden_changes:
  - scientific or citation changes
  - generated PDF, PNG, or ZIP binaries committed
stop_condition: All three builds and clean extracted-package checks pass, or the first local toolchain blocker is recorded.
```

## Abstract layout repair follow-up (reported rendering)

```yaml
target_artifact: Elsevier CAS first-page abstract/keyword/body layout
permitted_paths:
  - paper/elsevier.tex
  - paper/metadata/CAS_BIBTEX_REPAIR.md
frozen_scientific_meaning: All paper text, title, authorship, abstract wording, keywords, citations, equations, figures, and numerical content.
inputs:
  - reported first-page screenshot showing a literal "abstract" and overlapping keywords/body text
  - paper/abstract.tex
  - paper/styles/elsevier/cas-common.sty
expected_outputs:
  - CAS auxiliary abstract file containing the literal shared abstract prose
  - populated first-page abstract box with body text starting below the complete front matter
validation_command: make elsevier && pdftotext -f 1 -l 1 -layout dist/manuscript_elsevier.pdf -
forbidden_changes:
  - scientific or metadata changes
  - duplicated abstract prose
  - edits to the vendored CAS class/style
  - generated PDF, PNG, auxiliary, or ZIP files committed
stop_condition: The Elsevier PDF builds and its first-page text extraction contains the abstract before the body without overlap, or the first local toolchain blocker is recorded.
```

CAS 2.4 implements its lowercase `abstract` environment as a verbatim write to
`\jobname.abs`; `\maketitle` later reads that file into the title box.  Placing
the shared abstract macro directly in that capture left the CAS abstract column
empty in the reported rendering.  Because the keyword box is positioned beside
the abstract rather than independently reserving body space, the empty abstract
also allowed the keywords to extend over the first body paragraphs.

The first attempted repair put a literal `\input{abstract}` inside the CAS
abstract environment.  The reported follow-up rendering demonstrates that this
assumption was wrong: the abstract column contains only the literal filename
`abstract`.  That is consistent with CAS's verbatim capture treating the input
command as payload rather than expanding the shared prose.  With no abstract
height reserved, the unusually long keyword list then intrudes into the body.

The Elsevier wrapper now copies `paper/abstract.tex` line-for-line to the CAS
`\jobname.abs` auxiliary file using TeX file I/O before `\maketitle`.  CAS can
therefore read the prose it expects while `paper/abstract.tex` remains the one
shared scientific source.  No abstract wording or vendored class code changes.

### Local validation status (2026-07-24)

- **Primary evidence:** inspection of vendored `cas-common.sty` shows that the
  lowercase `abstract` environment opens `\jobname.abs` with `\verbatimwrite`,
  while the title builder later reads that auxiliary file inside `Abstract`.
- **Source claim:** the supplied screenshot shows the first-page output for the
  previously committed wrapper; it visibly contains `abstract` rather than the
  shared abstract prose and shows front-matter/body overlap.
- **Inference:** the visible literal filename is explained by putting an input
  command inside a verbatim-capture environment; the new adapter avoids that
  expansion boundary entirely.
- **Blocked:** `make elsevier` first stops in `scripts/generate_demo.py` with
  `ModuleNotFoundError: No module named 'matplotlib'`.  Installing
  `requirements-dev.txt` is also blocked because the package-index proxy
  returns HTTP 403.  The container additionally has no `latexmk`, `pdflatex`,
  or `pdftotext`, so the rendered-page acceptance test remains `REVIEW` here.
- **Next bounded action:** in the documented TeX environment with development
  requirements installed, run the validation command above and inspect the
  first-page extraction (or PDF) before accepting the repair.
