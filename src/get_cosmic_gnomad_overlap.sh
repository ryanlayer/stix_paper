bedtools intersect -wao -r -f 0.9  -a cosmic/cosmic.DEL.bed.gz -b gnomad/gnomad.DEL.bed \
> cosmic/cosmic.DEL.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a cosmic/cosmic.DUP.bed.gz -b gnomad/gnomad.DUP.bed \
> cosmic/cosmic.DUP.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a cosmic/cosmic.INV.bed.gz -b gnomad/gnomad.INV.bed \
> cosmic/cosmic.INV.gnomad.bed


