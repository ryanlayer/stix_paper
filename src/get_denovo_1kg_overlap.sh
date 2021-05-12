bedtools intersect -wao -r -f 0.9  -a denovo/dnsv.GRCh37.DEL.bed -b 1kg/1kg.DEL.gts.bed \
| python src/get_1kg_ac.py \
> denovo/dnsv.GRCh37.DEL.1kg.bed

bedtools intersect -wao -r -f 0.9  -a denovo/dnsv.GRCh37.DUP.bed -b 1kg/1kg.DUP.gts.bed \
| python src/get_1kg_ac.py \
> denovo/dnsv.GRCh37.DUP.1kg.bed

bedtools intersect -wao -r -f 0.9  -a denovo/dnsv.GRCh37.INV.bed -b 1kg/1kg.INV.gts.bed \
| python src/get_1kg_ac.py \
> denovo/dnsv.GRCh37.INV.1kg.bed

