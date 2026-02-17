#!/bin/bash
set -euo pipefail

# Only run in remote (web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"

# Verify required project files are present
required_files=("index.html" "manifest.json" "icon.svg")
for file in "${required_files[@]}"; do
  if [ ! -f "$PROJECT_DIR/$file" ]; then
    echo "WARNING: Required file not found: $file" >&2
  fi
done

echo "Session start: Trimble Connect extension project ready."
echo "Static HTML/JS project — no dependencies to install."
