pcawg_del=$( cat pcawg/pcawg.svs.DEL.bedpe.stix_sgdp | wc -l )
in_1kg_sgdp_del=$( (cat pcawg/pcawg.svs.DEL.bedpe.stix_sgdp | awk '$13>0' | cut -f 1-3; cat pcawg/pcawg.svs.DEL.bedpe.stix_1kg | awk '$13>0' | cut -f1-3) | sort -u | wc -l )
pcawg_dup=$( cat pcawg/pcawg.svs.DUP.bedpe.stix_sgdp | wc -l )
in_1kg_sgdp_dup=$( (cat pcawg/pcawg.svs.DUP.bedpe.stix_sgdp | awk '$13>0' | cut -f 1-3; cat pcawg/pcawg.svs.DUP.bedpe.stix_1kg | awk '$13>0' | cut -f1-3) | sort -u | wc -l )
pcawg_h2hinv=$( cat pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp | wc -l )
in_1kg_sgdp_h2hinv=$( (cat pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp | awk '$13>0' | cut -f 1-3; cat pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg | awk '$13>0' | cut -f1-3) | sort -u | wc -l )
pcawg_t2tinv=$( cat pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp | wc -l )
in_1kg_sgdp_t2tinv=$( (cat pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp | awk '$13>0' | cut -f 1-3; cat pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg | awk '$13>0' | cut -f1-3) | sort -u | wc -l )



echo -e "PCAWG DEL\t $pcawg_del"
echo -e "PCAWG & STIX SGDP DEL\t $in_1kg_sgdp_del"
echo -e "PCAWG DUP\t $pcawg_dup"
echo -e "PCAWG & STIX SGDP DUP\t $in_1kg_sgdp_dup"
echo -e "PCAWG H2HINV\t $pcawg_h2hinv"
echo -e "PCAWG & STIX SGDP H2HINV\t $in_1kg_sgdp_h2hinv"
echo -e "PCAWG T2TINV\t $pcawg_t2tinv"
echo -e "PCAWG & STIX SGDP T2TINV\t $in_1kg_sgdp_t2tinv"
