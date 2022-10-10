#!/usr/bin/env bash

if ! command -v snap &> /dev/null; then
  echo ">> ERROR  :: 'snap' is not installed."
  exit 1
fi

if ! command -v exercism &> /dev/null; then
  sudo snap install exercism
fi

# Install node modules
npm i

npx --no-install husky install
