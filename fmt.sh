#!/usr/bin/bash

cat city.raw.txt| egrep '^[0-9]+\s+.*' | awk -F '[ \t]+' '{print $1,$2}' | sort -n -k 1 -u | awk '{ printf ("%d:\"%s\",\n", $1, $2) }' > city.fmt.txt