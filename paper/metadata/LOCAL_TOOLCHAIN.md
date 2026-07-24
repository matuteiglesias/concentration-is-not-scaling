# Local toolchain

## Observed release environment

The baseline environment has Python 3.14.4 with `pytest 9.0.3`, no active virtual environment, and does not provide `numpy`, `pandas`, `matplotlib`, `latexmk`, `pdflatex`, `bibtex`, `texcount`, `pdfinfo`, or `pdftoppm`.

No global package installation was attempted: there is no project virtual environment.

## Exact PI setup commands (Ubuntu/Debian)

```bash
cd /workspace/concentration-is-not-scaling
python -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements-dev.txt
sudo apt-get update
sudo apt-get install -y latexmk texlive-latex-base texlive-latex-extra texlive-bibtex-extra texlive-extra-utils texlive-fonts-recommended poppler-utils
make all
```

The `sudo` commands are for the PI or an authorized system administrator; they were **not** run by this task. After setup, record exact command versions and rerun the release validation reports.
