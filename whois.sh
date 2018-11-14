#!/bin/bash
while read p; do
  echo "$p"  |  tr '\n' '\t'  && whois "$p" | grep -m 1 Registrar | awk -F "\:" '{print $2}'
done <whois.txt
