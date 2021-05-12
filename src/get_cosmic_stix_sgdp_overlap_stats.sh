cosmic_del=$( cat cosmic/cosmic.DEL.bed.stix_sgdp | wc -l )
in_sgdp_del=$( cat cosmic/cosmic.DEL.bed.stix_sgdp | awk '$5>0' | wc -l )
cosmic_dup=$( cat cosmic/cosmic.DUP.bed.stix_sgdp | wc -l )
in_sgdp_dup=$( cat cosmic/cosmic.DUP.bed.stix_sgdp | awk '$5>0' | wc -l )
cosmic_inv=$( cat cosmic/cosmic.INV.bed.stix_sgdp | wc -l )
in_sgdp_inv=$( cat cosmic/cosmic.INV.bed.stix_sgdp | awk '$5>0' | wc -l )

echo -e "COSMIC DEL\t $cosmic_del"
echo -e "COSMIC & STIX SGDP DEL\t $in_sgdp_del"
echo -e "COSMIC DUP\t $cosmic_dup"
echo -e "COSMIC & STIX SGDP DUP\t $in_sgdp_dup"
echo -e "COSMIC INV\t $cosmic_inv"
echo -e "COSMIC & STIX SGDP INV\t $in_sgdp_inv"
