#!/bin/sh
[ ! -d out/ ] && mkdir out/
pandoc -d pandoc.yaml
