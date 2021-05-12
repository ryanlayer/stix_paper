echo "Median number of samples with support"
cat denovo/dnsv.GRCh37.*.bed.stix_* | cut -f 1,2,3,4,5,6 | awk '$6>2' | sort | bedtools groupby -g 1,2,3,4 -c 5 -o max | awk '$5>0' | cut -f 5 | median
cat denovo/dnsv.GRCh37.*.bed.stix_* | cut -f 1,2,3,4,5,6 | awk '$6>2' | sort | bedtools groupby -g 1,2,3,4 -c 5 -o max | awk '$5>0' | cut -f 5 | minmax

total=$( cat denovo/dnsv.GRCh37.*.bed.stix_*       | cut -f 1,2,3,4,6 | bedtools sort -i stdin | bedtools groupby -g 1,2,3,4 -c 5 -o max | awk '$5>0'         | wc -l )
low_support=$( cat denovo/dnsv.GRCh37.*.bed.stix_* | cut -f 1,2,3,4,6 | bedtools sort -i stdin | bedtools groupby -g 1,2,3,4 -c 5 -o max | awk '$5>0 && $5<4' | wc -l )
hi_support=$( cat denovo/dnsv.GRCh37.*.bed.stix_*  | cut -f 1,2,3,4,6 | bedtools sort -i stdin | bedtools groupby -g 1,2,3,4 -c 5 -o max | awk '$5>0 && $5>=4'| wc -l )

echo total $total
echo low_support $low_support
echo hi_support $hi_support

echo "Percent supportd by 1,2, or 3 reads"
echo "scale=4; $low_support/$total" | bc

echo "Samples with at less 4 reads of support"
echo "scale=4; $hi_support/$total" | bc
