#!/usr/bin/env bash
set -euo pipefail
PYTHONPATH=src pytest -q tests
PYTHONPATH=src python scripts/generate_demo.py
