denovo_del=$( cat denovo/dnsv.GRCh37.DEL.bed.stix_sgdp | cut -f 1,2,3 | sort -u | wc -l )
in_sgdp_del=$( cat denovo/dnsv.GRCh37.DEL.bed.stix_sgdp | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
denovo_dup=$( cat denovo/dnsv.GRCh37.DUP.bed.stix_sgdp | cut -f 1,2,3 | sort -u | wc -l )
in_sgdp_dup=$( cat denovo/dnsv.GRCh37.DUP.bed.stix_sgdp | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
denovo_inv=$( cat denovo/dnsv.GRCh37.INV.bed.stix_sgdp | cut -f 1,2,3 | sort -u | wc -l )
in_sgdp_inv=$( cat denovo/dnsv.GRCh37.INV.bed.stix_sgdp | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )

echo -e "DENOVO DEL\t $denovo_del"
echo -e "DENOVO & STIX SGDP DEL\t $in_sgdp_del"
echo -e "DENOVO DUP\t $denovo_dup"
echo -e "DENOVO & STIX SGDP DUP\t $in_sgdp_dup"
echo -e "DENOVO INV\t $denovo_inv"
echo -e "DENOVO & STIX SGDP INV\t $in_sgdp_inv"
