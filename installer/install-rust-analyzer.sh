#!/usr/bin/env bash

set -e

os=$(uname -s | tr "[:upper:]" "[:lower:]")

case $os in
linux)
  platform="linux"
  ;;
darwin)
  platform="mac"

  # For apple silicon
  if [[ $(uname -m) == 'arm64' ]]; then
      platform="aarch64-apple-darwin"
  fi
  ;;
esac

curl -L -o "rust-analyzer-$platform.gz" "https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-$platform.gz"

gunzip "rust-analyzer-$platform.gz"
mv rust-analyzer-$platform rust-analyzer
chmod +x rust-analyzer
