denovo_del=$( cat denovo/dnsv.GRCh37.DEL.gnomad.bed | cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_del=$( cat denovo/dnsv.GRCh37.DEL.gnomad.bed | awk '$5!="."' | cut -f 1,2,3 | sort -u | wc -l )
denovo_dup=$( cat denovo/dnsv.GRCh37.DUP.gnomad.bed | cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_dup=$( cat denovo/dnsv.GRCh37.DUP.gnomad.bed | awk '$5!="."' | cut -f 1,2,3 | sort -u | wc -l )
denovo_inv=$( cat denovo/dnsv.GRCh37.INV.gnomad.bed | cut -f 1,2,3 | sort -u | wc -l )
in_gnomad_inv=$( cat denovo/dnsv.GRCh37.INV.gnomad.bed | awk '$5!="."' | cut -f 1,2,3 | sort -u | wc -l )

echo -e "DENOVO DEL\t $denovo_del"
echo -e "DENOVO & gnomAD DEL\t $in_gnomad_del"
echo -e "DENOVO DUP\t $denovo_dup"
echo -e "DENOVO & gnomAD DUP\t $in_gnomad_dup"
echo -e "DENOVO INV\t $denovo_inv"
echo -e "DENOVO & gnomAD INV\t $in_gnomad_inv"
