wget https://storage.googleapis.com/gnomad-public/papers/2019-sv/gnomad_v2.1_sv.sites.bed.gz

gunzip -c gnomad/gnomad_v2.1_sv.sites.bed.gz \
| awk '$5=="DEL"' | awk '{OFS="\t"; print $1,$2,$3,$37;}' \
> gnomad/gnomad.DEL.bed

gunzip -c gnomad/gnomad_v2.1_sv.sites.bed.gz \
| awk '$5=="DUP"' | awk '{OFS="\t"; print $1,$2,$3,$37;}' \
> gnomad/gnomad.DUP.bed

gunzip -c gnomad/gnomad_v2.1_sv.sites.bed.gz \
| awk '$5=="INV"' | awk '{OFS="\t"; print $1,$2,$3,$37;}' \
> gnomad/gnomad.INV.bed

