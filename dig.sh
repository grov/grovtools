#!/bin/bash
while read p; do
  echo "$p" | tr '\n' '\t' &&  dig "$p" +short
done <url.txt
