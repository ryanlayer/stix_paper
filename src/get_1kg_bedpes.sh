set -e 

bcftools view \
    -i 'SVTYPE="DEL"' \
    1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query \
    -f "%CHROM\t%POS\t%INFO/END\t%ALT\t%SVTYPE\t%CIPOS\t%CIEND\t%AC\n" \
| python src/get_1kg_bedpe.py \
> 1kg/1kg.DEL.bedpe

bcftools view \
    -i 'SVTYPE="DUP"' \
    1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query \
    -f "%CHROM\t%POS\t%INFO/END\t%ALT\t%SVTYPE\t%CIPOS\t%CIEND\t%AC\n" \
| python src/get_1kg_bedpe.py \
> 1kg/1kg.DUP.bedpe

bcftools view \
    -i 'SVTYPE="INV"' \
    1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query \
    -f "%CHROM\t%POS\t%INFO/END\t%ALT\t%SVTYPE\t%CIPOS\t%CIEND\t%AC\n" \
| python src/get_1kg_bedpe.py \
> 1kg/1kg.INV.bedpe
