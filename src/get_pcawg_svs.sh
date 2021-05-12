set -e

wget -O pcawg/final_consensus_sv_bedpe_passonly.icgc.public.tgz https://dcc.icgc.org/api/v1/download?fn=/PCAWG/consensus_sv/final_consensus_sv_bedpe_passonly.icgc.public.tgz
wget -O pcawg/final_consensus_sv_bedpe_passonly.tcga.public.tgz https://dcc.icgc.org/api/v1/download?fn=/PCAWG/consensus_sv/final_consensus_sv_bedpe_passonly.tcga.public.tgz
tar -xf pcawg/final_consensus_sv_bedpe_passonly.icgc.public.tgz -C pcawg
tar -xf pcawg/final_consensus_sv_bedpe_passonly.tcga.public.tgz -C pcawg
gunzip -c pcawg/icgc/open/*gz | sort | uniq > pcawg/icgc.svs.bedpe
gunzip -c pcawg/tcga/open/*gz | sort | uniq > pcawg/tcga.svs.bedpe
cat pcawg/tcga.svs.bedpe pcawg/icgc.svs.bedpe \
| awk '{OFS="\t";$7=".";$8=".";$12="."; print $0;}' \
| sort -u \
> pcawg/pcawg.svs.bedpe
cat pcawg/pcawg.svs.bedpe | awk '$11 == "DEL"' > pcawg/pcawg.svs.DEL.bedpe
cat pcawg/pcawg.svs.bedpe | awk '$11 == "DUP"' > pcawg/pcawg.svs.DUP.bedpe
cat pcawg/pcawg.svs.bedpe | awk '$11 == "h2hINV"' > pcawg/pcawg.svs.h2hINV.bedpe
cat pcawg/pcawg.svs.bedpe | awk '$11 == "t2tINV"' > pcawg/pcawg.svs.t2tINV.bedpe

cat pcawg/pcawg.svs.DEL.bedpe | awk '{OFS="\t";print $1,$2,$6,".";}' > pcawg/pcawg.svs.DEL.bed
cat pcawg/pcawg.svs.DUP.bedpe| awk '{OFS="\t";print $1,$2,$6,".";}' > pcawg/pcawg.svs.DUP.bed
cat pcawg/pcawg.svs.h2hINV.bedpe| awk '{OFS="\t";print $1,$2,$6,".";}' > pcawg/pcawg.svs.h2hINV.bed
cat pcawg/pcawg.svs.t2tINV.bedpe| awk '{OFS="\t";print $1,$2,$6,".";}' > pcawg/pcawg.svs.t2tINV.bed
