set -e

cosmic_del=$( cat cosmic/cosmic.DEL.1kg.bed | wc -l )
in_1kg_del=$( cat cosmic/cosmic.DEL.1kg.bed | awk '$5>0' | wc -l )
cosmic_dup=$( cat cosmic/cosmic.DUP.1kg.bed | wc -l )
in_1kg_dup=$( cat cosmic/cosmic.DUP.1kg.bed | awk '$5>0' | wc -l )
cosmic_inv=$( cat cosmic/cosmic.INV.1kg.bed | wc -l )
in_1kg_inv=$( cat cosmic/cosmic.INV.1kg.bed | awk '$5>0' | wc -l )

echo -e "COSMIC DEL\t $cosmic_del"
echo -e "COSMIC & 1KG DEL\t $in_1kg_del"
echo -e "COSMIC DUP\t $cosmic_dup"
echo -e "COSMIC & 1KG DUP\t $in_1kg_dup"
echo -e "COSMIC INV\t $cosmic_inv"
echo -e "COSMIC & 1KG INV\t $in_1kg_inv"
