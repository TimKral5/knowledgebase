#!/bin/sh

[ ! -d out/ ] && mkdir out/

pandoc docs/lossless_compression.md -o out/lossless_compression.pdf --filter=mermaid-filter
