#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../.."

python3 -m venv .venv
.venv/bin/pip install --upgrade pip wheel
.venv/bin/pip install pytest ruff build
if [ -f pyproject.toml ]; then
  .venv/bin/pip install -e ".[dev]" 2>/dev/null || .venv/bin/pip install -e .
elif [ -f setup.py ]; then
  .venv/bin/pip install -e .
fi
