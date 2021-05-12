denovo_del=$( cat denovo/dnsv.GRCh37.DEL.bed.stix_1kg | cut -f 1,2,3 | sort -u | wc -l )
in_1kg_del=$( cat denovo/dnsv.GRCh37.DEL.bed.stix_1kg | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
denovo_dup=$( cat denovo/dnsv.GRCh37.DUP.bed.stix_1kg | cut -f 1,2,3 | sort -u | wc -l )
in_1kg_dup=$( cat denovo/dnsv.GRCh37.DUP.bed.stix_1kg | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
denovo_inv=$( cat denovo/dnsv.GRCh37.INV.bed.stix_1kg | cut -f 1,2,3 | sort -u | wc -l )
in_1kg_inv=$( cat denovo/dnsv.GRCh37.INV.bed.stix_1kg | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )

echo -e "DENOVO DEL\t $denovo_del"
echo -e "DENOVO & STIX 1KG DEL\t $in_1kg_del"
echo -e "DENOVO DUP\t $denovo_dup"
echo -e "DENOVO & STIX 1KG DUP\t $in_1kg_dup"
echo -e "DENOVO INV\t $denovo_inv"
echo -e "DENOVO & STIX 1KG INV\t $in_1kg_inv"
