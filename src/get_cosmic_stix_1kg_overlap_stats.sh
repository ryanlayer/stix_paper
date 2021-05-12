cosmic_del=$( cat cosmic/cosmic.DEL.bed.stix_1kg | wc -l )
in_1kg_del=$( cat cosmic/cosmic.DEL.bed.stix_1kg | awk '$5>0' | wc -l )
cosmic_dup=$( cat cosmic/cosmic.DUP.bed.stix_1kg | wc -l )
in_1kg_dup=$( cat cosmic/cosmic.DUP.bed.stix_1kg | awk '$5>0' | wc -l )
cosmic_inv=$( cat cosmic/cosmic.INV.bed.stix_1kg | wc -l )
in_1kg_inv=$( cat cosmic/cosmic.INV.bed.stix_1kg | awk '$5>0' | wc -l )

echo -e "COSMIC DEL\t $cosmic_del"
echo -e "COSMIC & STIX 1KG DEL\t $in_1kg_del"
echo -e "COSMIC DUP\t $cosmic_dup"
echo -e "COSMIC & STIX 1KG DUP\t $in_1kg_dup"
echo -e "COSMIC INV\t $cosmic_inv"
echo -e "COSMIC & STIX 1KG INV\t $in_1kg_inv"
