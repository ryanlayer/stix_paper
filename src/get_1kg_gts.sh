bcftools view \
    -i 'SVTYPE="DEL"' \
    1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query -f "%CHROM\t%POS\t%INFO/END\t%ALT[\t%GT]\n" \
> 1kg/1kg.DEL.gts.bed

bcftools view \
    -i 'SVTYPE="DUP"' \
    1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query -f "%CHROM\t%POS\t%INFO/END\t%ALT[\t%GT]\n" \
> 1kg/1kg.DUP.gts.bed

bcftools view \
    -i 'SVTYPE="INV"' \
    1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query -f "%CHROM\t%POS\t%INFO/END\t%ALT[\t%GT]\n" \
> 1kg/1kg.INV.gts.bed
