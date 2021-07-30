#!/bin/env bash
input=$1
output=$2

cat $input | awk '$4!="."' |
    gargs -p 30 'c={0} s={1} e={2} cipos={3} ciend={4} bash src/slide.sh' > $output
