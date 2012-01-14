#!/bin/bash

set -e

for i in *.html; do
  sed -e 's/href="style/href="doc\/style/' $i > $i.tmp
  mv $i.tmp $i
done

