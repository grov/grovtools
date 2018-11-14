#!/bin/bash
while read p; do
  echo "$p" | tr '\n' '\t' && ping -c 1 "$p" | head -1 | sed 's/.*(\(.*\)).*(\(.*\)).*/\1/'
done <url.txt
