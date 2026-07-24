.PHONY: test demo verify arxiv elsevier package clean all

test:
	PYTHONPATH=src pytest -q tests

demo:
	PYTHONPATH=src python scripts/generate_demo.py

verify:
	bash scripts/verify.sh

arxiv:
	bash scripts/build_arxiv.sh

elsevier:
	bash scripts/build_elsevier.sh

package:
	bash scripts/package_release.sh

all: verify arxiv elsevier package

clean:
	latexmk -C -outdir=dist paper/arxiv.tex || true
	latexmk -C -outdir=dist paper/elsevier.tex || true
	rm -rf dist build .pytest_cache .arxiv-package .elsevier-package
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
	find . -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete
	find paper/figures artifacts/reference/variance_scaling_demo_v0_2 -type f -name '*.png' -delete
