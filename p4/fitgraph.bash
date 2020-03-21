#!/bin/bash
for f in data/f*; do
  filename=$(basename -- "$f")
  name=${filename%.*}
  echo "Processing $filename...";
  extrapars=$(cat initialconditions/$filename)
  ./fitgraph.gnu $f $name $extrapars
done
