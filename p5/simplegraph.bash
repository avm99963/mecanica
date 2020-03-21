#!/bin/bash
for f in data/*; do
  filename=$(basename -- "$f")
  name=${filename%.*}
  echo "Processing $filename...";
  ./simplegraph.gnu $f $name
done
