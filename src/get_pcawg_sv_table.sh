DELS=0
FOUND_DELS=1
DUPS=2
FOUND_DUPS=3
H2HINVS=4
FOUND_H2HINVS=5
T2TINVS=6
FOUND_T2TINVS=7

stix_sgdp=( $(cat pcawg/pcawg.stix_sgdp_stats | cut -f 2 | paste -sd ' ' -) )
stix_1kg=( $(cat pcawg/pcawg.stix_1kg_stats | cut -f 2 | paste -sd ' ' -) )
stix_1kg_sgdp=( $(cat pcawg/pcawg.stix_1kg_sgdp_stats | cut -f 2 | paste -sd ' ' -) )
onekg=( $(cat pcawg/pcawg.1kg_stats | cut -f 2 | paste -sd ' ' -) )
gnomad=( $(cat pcawg/pcawg.gnomad_stats | cut -f 2 | paste -sd ' ' -) )

function print_header
{
    array=($@)
    echo -e "${array[$DELS]}\t\t${array[$DUPS]}\t\t${array[$H2HINVS]}\t\t${array[$T2TINVS]}"
}

function print_row
{
    array=($@)
    del_ratio=$( echo "scale=4; ${array[$FOUND_DELS]} / ${array[$DELS]}" | bc )
    dup_ratio=$( echo "scale=4; ${array[$FOUND_DUPS]} / ${array[$DUPS]}" | bc )
    h2hinv_ratio=$( echo "scale=4; ${array[$FOUND_H2HINVS]} / ${array[$H2HINVS]}" | bc )
    t2tinv_ratio=$( echo "scale=4; ${array[$FOUND_T2TINVS]} / ${array[$T2TINVS]}" | bc )
    echo -e "${array[$FOUND_DELS]}\t" \
            "$del_ratio\t" \
            "${array[$FOUND_DUPS]}\t" \
            "$dup_ratio\t" \
            "${array[$FOUND_H2HINVS]}" \
            "$h2hinv_ratio\t" \
            "${array[$FOUND_T2TINVS]}" \
            "$t2tinv_ratio\t" 
}


echo -en "DENOVO catalog\t"
print_header ${stix_sgdp[@]}

echo -en "STIX SGDP\t"
print_row  ${stix_sgdp[@]}

echo -en "STIX 1KG\t"
print_row ${stix_1kg[@]}

echo -en "STIX SGDP 1KG\t"
print_row ${stix_1kg_sgdp[@]}

echo -en "1KG catalog\t"
print_row ${onekg[@]}

echo -en "gnomad catalog\t"
print_row ${gnomad[@]}
