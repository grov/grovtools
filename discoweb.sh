#!/bin/bash
echo "URL, code_http, code_https, IP"
while read url; do
echo "$url" | tr '\n' '\t' &&
curl -o /dev/null --silent -k --head --write-out "%{http_code}" http://"$url" &&
echo ", " | tr '\n' '\b' &&
curl -o /dev/null --silent -k --head --write-out "%{http_code}" https://"$url" &&
echo ", " | tr '\n' '\b' &&
ping -c 1 "$url" | head -1 | sed 's/.*(\(.*\)).*(\(.*\)).*/\1/'

done < url.txt
