#!/usr/bin/env bash
# Usage: ./run_tests.sh [extra robot args...]
#   ./run_tests.sh                       # everything
#   ./run_tests.sh --include smoke       # by tag
#   ./run_tests.sh --variable URL:https://staging.example.com
set -euo pipefail
cd "$(dirname "$0")/scenario"
robot \
  --outputdir results \
  --listener RetryFailed:1 \
  "$@" \
  tests/
