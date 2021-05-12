bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.DEL.bed -b 1kg/1kg.DEL.gts.bed \
| python src/get_1kg_ac.py \
> pcawg/pcawg.DEL.1kg.bed

bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.DUP.bed -b 1kg/1kg.DUP.gts.bed \
| python src/get_1kg_ac.py \
> pcawg/pcawg.DUP.1kg.bed

bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.h2hINV.bed -b 1kg/1kg.INV.gts.bed \
| python src/get_1kg_ac.py \
> pcawg/pcawg.h2hINV.1kg.bed

bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.t2tINV.bed -b 1kg/1kg.INV.gts.bed \
| python src/get_1kg_ac.py \
> pcawg/pcawg.t2tINV.1kg.bed
