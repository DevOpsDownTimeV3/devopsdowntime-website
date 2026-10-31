#!/bin/sh
# Validate the page before pushing. Usage: scripts/lint.sh
set -e
npx --yes html-validate@8.24.1 index.html
npx --yes stylelint@16.10.0 styles.css --config '{"rules":{}}'
