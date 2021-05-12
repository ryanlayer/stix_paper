pcawg_del=$(  cat pcawg/pcawg.svs.DEL.bedpe.stix_1kg | wc -l )
in_1kg_del=$( cat pcawg/pcawg.svs.DEL.bedpe.stix_1kg | awk '$13>0' | wc -l )
pcawg_dup=$(  cat pcawg/pcawg.svs.DUP.bedpe.stix_1kg | wc -l )
in_1kg_dup=$( cat pcawg/pcawg.svs.DUP.bedpe.stix_1kg| awk '$13>0' | wc -l )
pcawg_h2hinv=$(  cat pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg | wc -l )
in_1kg_h2hinv=$( cat pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg | awk '$13>0' | wc -l )
pcawg_t2tinv=$(  cat pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg | wc -l )
in_1kg_t2tinv=$( cat pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg | awk '$13>0' | wc -l )

echo -e "PCAWG DEL\t $pcawg_del"
echo -e "PCAWG & STIX 1KG DEL\t $in_1kg_del"
echo -e "PCAWG DUP\t $pcawg_dup"
echo -e "PCAWG & STIX 1KG DUP\t $in_1kg_dup"
echo -e "PCAWG H2HINV\t $pcawg_h2hinv"
echo -e "PCAWG & STIX 1KG H2HINV\t $in_1kg_h2hinv"
echo -e "PCAWG T2TINV\t $pcawg_t2tinv"
echo -e "PCAWG & STIX 1KG T2TINV\t $in_1kg_t2tinv"
