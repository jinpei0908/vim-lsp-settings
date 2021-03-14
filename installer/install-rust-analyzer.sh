#!/usr/bin/env bash

set -e

os=$(uname -s | tr "[:upper:]" "[:lower:]")

case $os in
linux)
  suffix="linux"
  ;;
darwin)
  suffix="mac"

  # Suffix for apple silicon
  if [[ $(uname -m) == 'arm64' ]]; then
      suffix="aarch64-apple-darwin"
  fi
  ;;
esac

curl -L -o "rust-analyzer-$suffix.gz" "https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-$suffix.gz"

gunzip "rust-analyzer-$suffix.gz"
mv rust-analyzer-$suffix rust-analyzer
chmod +x rust-analyzer
