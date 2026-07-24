# Wrapper validation

## Static findings

- The arXiv wrapper uses the neutral `article` class, a working-paper version/date, the full current affiliation, and a clickable `https://orcid.org/0000-0002-2634-2944` link.
- The Elsevier wrapper uses the included CAS class's declared `orcid` author key: `\author[1,orcid=0000-0002-2634-2944]{Matías Iglesias}`. Inspection of `paper/styles/elsevier/cas-common.sty` shows that this key is written to the auxiliary file and rendered by `\printorcid` in first-page notes.
- Both wrappers explicitly set PDF title, author, subject, keywords, and creator metadata through `\hypersetup`.

## Build status

Rendered checks are blocked: `latexmk`, `pdflatex`, `bibtex`, `pdfinfo`, and `pdftoppm` are absent, and Python figure generation is blocked by missing `matplotlib`. Therefore, no claim is made here that ORCID rendering, PDF metadata, pages, or figures have been validated in a PDF.

After the toolchain described in `LOCAL_TOOLCHAIN.md` is installed, run `make arxiv`, `make elsevier`, `pdfinfo dist/manuscript_arxiv_v1.pdf`, and `pdfinfo dist/manuscript_elsevier.pdf`; review rendered first pages and the shared scientific pages before upload or submission.
