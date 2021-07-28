#!/bin/env bash

set -exuo pipefail

input_bed=$1
icgc_bed=$2
output=$3

bedtools intersect -b $input_bed -a $icgc_bed -f 0.9 -r -u | bedtools sort > $output
