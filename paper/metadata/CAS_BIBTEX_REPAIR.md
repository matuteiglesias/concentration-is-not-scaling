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
