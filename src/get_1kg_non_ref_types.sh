bcftools view \
    -i 'SVTYPE=="DUP"' \
1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query \
        -f "%CHROM %POS %END %CIPOS %CIEND [\t%GT,%SAMPLE]\n" \
| python src/get_non_ref.py > 1kg/1kg.DUP.nonref_samples.bed

bcftools view \
    -i 'SVTYPE=="DEL"' \
1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query \
        -f "%CHROM %POS %END %CIPOS %CIEND [\t%GT,%SAMPLE]\n" \
| python src/get_non_ref.py > 1kg/1kg.DEL.nonref_samples.bed

bcftools view \
    -i 'SVTYPE=="INV"' \
1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz \
| bcftools query \
        -f "%CHROM %POS %END %CIPOS %CIEND [\t%GT,%SAMPLE]\n" \
| python src/get_non_ref.py > 1kg/1kg.INV.nonref_samples.bed
