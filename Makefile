.PHONY: test demo verify arxiv elsevier package clean all

test:
	PYTHONPATH=src pytest -q tests

demo:
	PYTHONPATH=src python scripts/generate_demo.py

verify: test demo

arxiv:
	bash scripts/build_arxiv.sh

elsevier:
	bash scripts/build_elsevier.sh

package:
	bash scripts/package_release.sh

all: verify arxiv elsevier package

clean:
	latexmk -C paper/arxiv.tex || true
	latexmk -C paper/elsevier.tex || true
	rm -rf dist build .pytest_cache
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
