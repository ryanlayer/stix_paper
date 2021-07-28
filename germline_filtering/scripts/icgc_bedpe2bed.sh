#!/bin/env bash
set -exuo pipefail

input=$1
output=$2
svtype=$3

zcat $input | tail -n+2 |
    awk -v svtype=$svtype '{OFS="\t"; if ($11==svtype) print $1,$2,$6,$11;}' > $output
