pcawg_del=$( cat pcawg/pcawg.svs.DEL.gnomad.bed| cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_del=$( cat pcawg/pcawg.svs.DEL.gnomad.bed | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
pcawg_dup=$( cat pcawg/pcawg.svs.DUP.gnomad.bed | cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_dup=$( cat pcawg/pcawg.svs.DUP.gnomad.bed | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
pcawg_t2tinv=$( cat pcawg/pcawg.svs.t2tINV.gnomad.bed | cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_t2tinv=$( cat pcawg/pcawg.svs.t2tINV.gnomad.bed | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )
pcawg_h2hinv=$( cat pcawg/pcawg.svs.h2hINV.gnomad.bed | cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_h2hinv=$( cat pcawg/pcawg.svs.h2hINV.gnomad.bed | awk '$5>0' | cut -f 1,2,3 | sort -u | wc -l )

echo -e "PCAWG DEL\t $pcawg_del"
echo -e "PCAWG & GNOMAD DEL\t $in_gnomad_del"
echo -e "PCAWG DUP\t $pcawg_dup"
echo -e "PCAWG & GNOMAD DUP\t $in_gnomad_dup"
echo -e "PCAWG H2HINV\t $pcawg_h2hinv"
echo -e "PCAWG & GNOMAD H2HINV\t $in_gnomad_h2hinv"
echo -e "PCAWG T2TINV\t $pcawg_t2tinv"
echo -e "PCAWG & GNOMAD T2TINV\t $in_gnomad_t2tinv"
