#!/bin/env bash
echo -en "$c\t$s\t$e\t$cipos\t$ciend\t"
for i in $(seq -500 50 -50; seq 0 50 500); do
    cs=$(( s+i ))
    ce=$(( e+i ))
    v=$(./qdelci.sh $c $cs $ce $cipos $ciend)
    echo -n "$v "
done
echo
