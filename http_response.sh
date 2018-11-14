#!/bin/bash
while read p; do
  echo "$p" | tr '\n' '\t' && curl -o /dev/null --silent -k --head --write-out "%{http_code}\n" "$p"
done < url.txt
