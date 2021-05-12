pcawg_del=$(  cat pcawg/pcawg.svs.DEL.bedpe.stix_sgdp | wc -l )
in_sgdp_del=$( cat pcawg/pcawg.svs.DEL.bedpe.stix_sgdp | awk '$13>0' | wc -l )
pcawg_dup=$(  cat pcawg/pcawg.svs.DUP.bedpe.stix_sgdp | wc -l )
in_sgdp_dup=$( cat pcawg/pcawg.svs.DUP.bedpe.stix_sgdp| awk '$13>0' | wc -l )
pcawg_h2hinv=$(  cat pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp | wc -l )
in_sgdp_h2hinv=$( cat pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp | awk '$13>0' | wc -l )
pcawg_t2tinv=$(  cat pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp | wc -l )
in_sgdp_t2tinv=$( cat pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp | awk '$13>0' | wc -l )

echo -e "PCAWG DEL\t $pcawg_del"
echo -e "PCAWG & STIX SGDP DEL\t $in_sgdp_del"
echo -e "PCAWG DUP\t $pcawg_dup"
echo -e "PCAWG & STIX SGDP DUP\t $in_sgdp_dup"
echo -e "PCAWG H2HINV\t $pcawg_h2hinv"
echo -e "PCAWG & STIX SGDP H2HINV\t $in_sgdp_h2hinv"
echo -e "PCAWG T2TINV\t $pcawg_t2tinv"
echo -e "PCAWG & STIX SGDP T2TINV\t $in_sgdp_t2tinv"
