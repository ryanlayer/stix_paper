#!/bin/env bash

set -exuo pipefail

stix_bed=$1
onekg_bedpe=$2
output=$3

tail -n+2 $onekg_bedpe | awk '{OFS="\t"; print $1,$2,$6;}' |
    bedtools intersect -v -r -f 0.9 -a $stix_bed -b stdin  |
    grep -v hs | grep -v GL | grep -v X | grep -v Y > $output
