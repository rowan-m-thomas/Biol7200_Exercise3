#!/usr/bin/env bash

query=$1
subject=$2
output=$3

echo "Query: $query"
echo "Subject: $subject"
echo "Output: $output"

tblastn -query "$query" -subject "$subject" -outfmt '6 std qlen' | awk '$3 > 30 && $4 > 0.9 * $13' > "$output"

cat "$output" | wc -l
