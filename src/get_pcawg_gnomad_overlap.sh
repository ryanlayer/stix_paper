bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.DEL.bed -b gnomad/gnomad.DEL.bed \
> pcawg/pcawg.svs.DEL.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.DUP.bed -b gnomad/gnomad.DUP.bed \
> pcawg/pcawg.svs.DUP.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.h2hINV.bed -b gnomad/gnomad.INV.bed \
> pcawg/pcawg.svs.h2hINV.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a pcawg/pcawg.svs.t2tINV.bed -b gnomad/gnomad.INV.bed \
> pcawg/pcawg.svs.t2tINV.gnomad.bed
