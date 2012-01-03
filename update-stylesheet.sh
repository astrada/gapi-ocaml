#!/bin/bash

set -e

for i in *.html; do
  sed -e 's/href="\.\.\/\.\.\/doc/href="doc/' $i > $i.tmp
  mv $i.tmp $i
done

