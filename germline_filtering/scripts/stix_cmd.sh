#!/bin/env bash
set -euo pipefail
input=$1
output=$2
threads=$3
svtype=$4
bcftools query -f '%CHROM\t%POS\t%INFO/END\n' $input |
    gargs -p $threads \
          'bash scripts/qdel.sh {0} {1} {2} /home/much8161/data/stix/1kg '"$svtype" \
          > $output
