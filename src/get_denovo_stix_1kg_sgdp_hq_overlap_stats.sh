denovo_del=$( cat denovo/dnsv.GRCh37.DEL.bed | wc -l )
in_1kg_sgdp_del=$( (cat denovo/dnsv.GRCh37.DEL.bed.stix_sgdp | awk '$6>2' | cut -f 1-3; cat denovo/dnsv.GRCh37.DEL.bed.stix_1kg | awk '$6>2' | cut -f1-3) | sort -u | wc -l )
denovo_dup=$( cat denovo/dnsv.GRCh37.DUP.bed | wc -l )
in_1kg_sgdp_dup=$( (cat denovo/dnsv.GRCh37.DUP.bed.stix_sgdp | awk '$6>2' | cut -f 1-3; cat denovo/dnsv.GRCh37.DUP.bed.stix_1kg | awk '$6>2' | cut -f1-3) | sort -u | wc -l )
denovo_inv=$( cat denovo/dnsv.GRCh37.INV.bed | wc -l )
in_1kg_sgdp_inv=$( (cat denovo/dnsv.GRCh37.INV.bed.stix_sgdp | awk '$6>2' | cut -f 1-3; cat denovo/dnsv.GRCh37.INV.bed.stix_1kg | awk '$6>2' | cut -f1-3) | sort -u | wc -l )

echo -e "DENOVO DEL\t $denovo_del"
echo -e "DENOVO & STIX SGDP DEL\t $in_1kg_sgdp_del"
echo -e "DENOVO DUP\t $denovo_dup"
echo -e "DENOVO & STIX SGDP DUP\t $in_1kg_sgdp_dup"
echo -e "DENOVO INV\t $denovo_inv"
echo -e "DENOVO & STIX SGDP INV\t $in_1kg_sgdp_inv"
