#!/bin/bash

set -e

if [ -e "$(git diff HEAD~ -- src/)" ]; then
  echo "No changes in the code."
  exit 0
fi

if [ -z "$(git diff HEAD~ -- Cargo.toml | grep -q '^+version =')" ]; then
  echo "None of commits in this PR has changed version in Cargo.toml!"
  exit 1
fi
