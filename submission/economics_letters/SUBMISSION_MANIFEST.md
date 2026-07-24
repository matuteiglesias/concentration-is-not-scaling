# Economics Letters submission manifest

**Status:** Not final. The live journal guide has not been verified.

## Generated only after validated build

- `manuscript_elsevier.pdf` — required status unknown; never commit.
- `manuscript_source.zip` — required status unknown; never commit.

## Prepared text assets

All files in this directory are templates or PI-review inputs. They are **not** a final upload manifest. Retain only those confirmed required or accepted by the current live guide/submission system.

## CAS source-package contract

When `make package` succeeds, `dist/elsevier_submission_source.zip` must contain only `manuscript.tex`, `content.tex`, `references.bib`, `elsevier.bbl`, `styles/elsevier/cas-dc.cls`, `styles/elsevier/cas-common.sty`, `styles/elsevier/cas-model2-names.bst`, and the two required PDF figures. `cas-sc.cls` is excluded because `cas-dc.cls` is the active document class. The package must compile after extraction using only these contents.
