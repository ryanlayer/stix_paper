DELS=0
FOUND_DELS=1
DUPS=2
FOUND_DUPS=3
INVS=4
FOUND_INVS=5



stix_sgdp=( $(cat denovo/denovo.stix_sgdp_hq_stats | cut -f 2 | paste -sd ' ' -) )
stix_1kg=( $(cat denovo/denovo.stix_1kg_hq_stats | cut -f 2 | paste -sd ' ' -) )
stix_1kg_sgdp=( $(cat denovo/denovo.stix_1kg_sgdp_hq_stats | cut -f 2 | paste -sd ' ' -) )
onekg=( $(cat denovo/denovo.1kg_stats | cut -f 2 | paste -sd ' ' -) )
gnomad=( $(cat denovo/denovo.gnomad_stats | cut -f 2 | paste -sd ' ' -) )

function print_header
{
    array=($@)
    echo -e "${array[$DELS]}\t\t${array[$DUPS]}\t\t${array[$INVS]}"
}

function print_row
{
    array=($@)
    del_ratio=$( echo "scale=4; ${array[$FOUND_DELS]} / ${array[$DELS]}" | bc )
    dup_ratio=$( echo "scale=4; ${array[$FOUND_DUPS]} / ${array[$DUPS]}" | bc )
    inv_ratio=$( echo "scale=4; ${array[$FOUND_INVS]} / ${array[$INVS]}" | bc )
    echo -e "${array[$FOUND_DELS]}\t" \
            "$del_ratio\t" \
            "${array[$FOUND_DUPS]}\t" \
            "$dup_ratio\t" \
            "${array[$FOUND_INVS]}" \
            "$inv_ratio\t" 
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
