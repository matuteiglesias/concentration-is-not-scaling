# Numerical validation

## Scope and boundary

The deterministic v0.2 artifact validates the algebraic variance-accounting and finite-interval signed-contribution identities. It does **not** estimate or validate a French-export scaling exponent.

## Release-environment attempt

| Command | Status | Observed result |
| --- | --- | --- |
| `make test` | BLOCKED | Test collection stopped with `ModuleNotFoundError: No module named 'numpy'` in all three test modules. |
| `make demo` | BLOCKED | `scripts/generate_demo.py` stopped with `ModuleNotFoundError: No module named 'matplotlib'`. |
| `make verify` | BLOCKED | Its test stage stopped with the same missing `numpy` error. |

Environment: `/root/.pyenv/shims/python`, Python 3.14.4, no active virtual environment. `pytest 9.0.3` is installed; `numpy`, `pandas`, and `matplotlib` are absent.

## Requested validation fields

- **Test count:** unavailable: collection did not complete.
- **Maximum residual by check type:** unavailable from this environment: the generator could not run.
- **Generated-artifact checksum:** unavailable: no artifact was regenerated.
- **Generated artifact path (when toolchain is available):** `artifacts/reference/variance_scaling_demo_v0_2/`, with ignored PNG mirrors in `paper/figures/`.

## Next bounded action

Create and activate the project virtual environment, install `requirements-dev.txt`, then rerun `make verify`. Record the test count, residual maxima from `checks.csv`, and a SHA-256 checksum of the regenerated machine-readable artifact before treating this release gate as passed.

## Wrapper/package attempt

`make arxiv`, `make elsevier`, and `make package` were each attempted. All stopped first in `scripts/generate_demo.py` with `ModuleNotFoundError: No module named 'matplotlib'`; no TeX command, PDF metadata check, ZIP validation, page count, or checksum generation was reached.
