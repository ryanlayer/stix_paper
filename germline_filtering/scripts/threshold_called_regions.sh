#!/bin/env bash

input=$1
output=$2
threshold=$3

awk -v threshold=$threshold '{OFS="\t"; if ($6<=threshold) print $0;}' $input > $output
