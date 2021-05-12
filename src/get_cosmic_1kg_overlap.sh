bedtools intersect -wao -r -f 0.9  -a cosmic/cosmic.DEL.bed.gz -b 1kg/1kg.DEL.gts.bed \
| python src/get_1kg_ac.py \
> cosmic/cosmic.DEL.1kg.bed

bedtools intersect -wao -r -f 0.9  -a cosmic/cosmic.DUP.bed.gz -b 1kg/1kg.DUP.gts.bed \
| python src/get_1kg_ac.py \
> cosmic/cosmic.DUP.1kg.bed

bedtools intersect -wao -r -f 0.9  -a cosmic/cosmic.INV.bed.gz -b 1kg/1kg.INV.gts.bed \
| python src/get_1kg_ac.py \
> cosmic/cosmic.INV.1kg.bed
