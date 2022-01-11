#!/bin/bash

set -e

if [ -z "$(git diff HEAD origin/main -- src/)" ]; then
  echo "No changes in the code."
  exit 0
fi

if [ -z "$(git diff HEAD origin/main -- Cargo.toml | grep '^+version =')" ]; then
  echo "This PR does not change version in Cargo.toml!"
  exit 1
fi
