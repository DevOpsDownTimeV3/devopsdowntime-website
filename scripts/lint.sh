#!/bin/sh
# Validate the page before pushing. Usage: scripts/lint.sh
set -e
npx --yes html-validate@8 index.html
