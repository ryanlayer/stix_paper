cosmic_del=$( cat cosmic/cosmic.DEL.gnomad.bed | wc -l )
in_gnomad_del=$( cat cosmic/cosmic.DEL.gnomad.bed | awk '$5!="."' | wc -l )
cosmic_dup=$( cat cosmic/cosmic.DUP.gnomad.bed | wc -l )
in_gnomad_dup=$( cat cosmic/cosmic.DUP.gnomad.bed | awk '$5!="."' | wc -l )
cosmic_inv=$( cat cosmic/cosmic.INV.gnomad.bed | wc -l )
in_gnomad_inv=$( cat cosmic/cosmic.INV.gnomad.bed | awk '$5!="."' | wc -l )

echo -e "COSMIC DEL\t $cosmic_del"
echo -e "COSMIC & gnomAD DEL\t $in_gnomad_del"
echo -e "COSMIC DUP\t $cosmic_dup"
echo -e "COSMIC & gnomAD DUP\t $in_gnomad_dup"
echo -e "COSMIC INV\t $cosmic_inv"
echo -e "COSMIC & gnomAD INV\t $in_gnomad_inv"
