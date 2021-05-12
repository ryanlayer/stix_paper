#wget -O denovo/all_dnsv.GRCh38.csv https://raw.githubusercontent.com/jbelyeu/dnSV-manuscript/main/data/all_dnsv.csv
#cat denovo/all_dnsv.GRCh38.csv  | awk -F"," '{OFS="\t"; print $1,$2,$3,$7;}' > denovo/all_dnsv.GRCh38.bed
## Lift from GRCh38 to GRCh37 using https://genome.ucsc.edu/cgi-bin/hgLiftOver and name all_dnsv.GRCh37.bed
cat denovo/all_dnsv.GRCh37.bed | sed -e "s/^chr//" | grep DEL > denovo/dnsv.GRCh37.DEL.bed
cat denovo/all_dnsv.GRCh37.bed | sed -e "s/^chr//" | grep DUP > denovo/dnsv.GRCh37.DUP.bed
cat denovo/all_dnsv.GRCh37.bed | sed -e "s/^chr//" | grep INV > denovo/dnsv.GRCh37.INV.bed
