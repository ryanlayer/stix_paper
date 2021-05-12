gunzip -c cosmic/CosmicBreakpointsExport.tsv.gz  \
| awk -F "\t" '$10=="intrachromosomal deletion" && $13==37' \
| awk -F "\t" '{ OFS="\t"; print $14,$15,$20,$2; }' \
| awk '$3>$2' \
| sort -u \
| bedtools sort -i stdin \
| bgzip -c \
> cosmic/cosmic.DEL.bed.gz

gunzip -c cosmic/CosmicBreakpointsExport.tsv.gz  \
| awk -F "\t" '$10=="intrachromosomal tandem duplication" && $13==37' \
| awk -F "\t" '{ OFS="\t"; print $14,$15,$20,$2; }' \
| awk '$3>$2' \
| sort -u \
| bedtools sort -i stdin \
| bgzip -c \
> cosmic/cosmic.DUP.bed.gz

gunzip -c cosmic/CosmicBreakpointsExport.tsv.gz  \
| awk -F "\t" '$10=="intrachromosomal inversion" && $13==37' \
| awk -F "\t" '{ OFS="\t"; print $14,$15,$20,$2; }' \
| awk '$3>$2' \
| sort -u \
| bedtools sort -i stdin \
| bgzip -c \
> cosmic/cosmic.INV.bed.gz
