bedtools intersect -wao -r -f 0.9  -a denovo/dnsv.GRCh37.DEL.bed -b gnomad/gnomad.DEL.bed \
> denovo/dnsv.GRCh37.DEL.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a denovo/dnsv.GRCh37.DUP.bed -b gnomad/gnomad.DUP.bed \
> denovo/dnsv.GRCh37.DUP.gnomad.bed

bedtools intersect -wao -r -f 0.9  -a denovo/dnsv.GRCh37.INV.bed -b gnomad/gnomad.INV.bed \
> denovo/dnsv.GRCh37.INV.gnomad.bed
