rule all:
    input:
        '1kg_sv_table.txt',
        'cosmic_sv_table.txt',
        'cosmic.DEL.bed.stix_1kg.png',
        'cosmic.DEL.bed.stix_1kg.pdf',
        'cosmic.DEL.bed.stix_sgdp.png',
        'cosmic.DEL.bed.stix_sgdp.pdf',
        'cosmic_1kg_ac_stix_1kg_nz_plot.png',
        'cosmic_1kg_ac_stix_1kg_nz_plot.pdf',
        'pcawg_sv_table.txt',
        'pcawg.DEL.bed.stix_1kg.png',
        'pcawg.DEL.bed.stix_1kg.pdf',
        'pcawg.DEL.bed.stix_sgdp.png',
        'pcawg.DEL.bed.stix_sgdp.pdf',
        'pcawg_1kg_ac_stix_1kg_nz_plot.png',
        'pcawg_1kg_ac_stix_1kg_nz_plot.pdf',
        'denovo_sv_table.txt',
        'denovo_sv_hq_table.txt',
        'denovo.DEL.bed.stix_1kg.png',
        'denovo.DEL.bed.stix_1kg.pdf',
        'denovo.DEL.bed.stix_sgdp.png',
        'denovo.DEL.bed.stix_sgdp.pdf',
        'denovo_1kg_ac_stix_1kg_nz_plot.png',
        'denovo_1kg_ac_stix_1kg_nz_plot.pdf'

rule inflate:
    intput:
        'cosmic/cosmic.DEL.bed.stix_1kg.gz',
        'cosmic/cosmic.INVGRCh37.INV.bed.stix_1kg.gz',
        'cosmic/cosmic.DUP.bed.stix_1kg.gz',
        'cosmic/cosmic.INV.bed.stix_1kg.gz',
        'pcawg/pcawg.svs.DEL.bedpe.stix_1kg.gz',
        'pcawg/pcawg.svs.DUP.bedpe.stix_1kg.gz',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg.gz',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg.gz',
        'denovo/dnsv.GRCh37.INV.bed.stix_1kg.gz',
        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg.gz',
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg.gz',
        '1kg/1kg.INV.nonref_samples.bed.stix_1kg.gz',
        '1kg/1kg.DEL.nonref_samples.bed.stix_1kg.gz',
        '1kg/1kg.DUP.nonref_samples.bed.stix_1kg.gz',
        'cosmic/cosmic.INV.bed.stix_sgdp.gz',
        'cosmic/cosmic.DUP.bed.stix_sgdp.gz',
        'cosmic/cosmic.DEL.bed.stix_sgdp.gz',
        'pcawg/pcawg.svs.gt_500bp.bedpe.stix_sgdp.gz',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp.gz',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp.gz',
        'pcawg/pcawg.svs.DUP.bedpe.stix_sgdp.gz',
        'pcawg/pcawg.svs.DEL.bedpe.stix_sgdp.gz',
        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp.gz',
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp.gz',
        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp.gz'
    output:
        'cosmic/cosmic.DEL.bed.stix_1kg',
        'cosmic/cosmic.INVGRCh37.INV.bed.stix_1kg',
        'cosmic/cosmic.DUP.bed.stix_1kg',
        'cosmic/cosmic.INV.bed.stix_1kg',
        'pcawg/pcawg.svs.DEL.bedpe.stix_1kg',
        'pcawg/pcawg.svs.DUP.bedpe.stix_1kg',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg',
        'denovo/dnsv.GRCh37.INV.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg',
        '1kg/1kg.INV.nonref_samples.bed.stix_1kg',
        '1kg/1kg.DEL.nonref_samples.bed.stix_1kg',
        '1kg/1kg.DUP.nonref_samples.bed.stix_1kg',
        'cosmic/cosmic.INV.bed.stix_sgdp',
        'cosmic/cosmic.DUP.bed.stix_sgdp',
        'cosmic/cosmic.DEL.bed.stix_sgdp',
        'pcawg/pcawg.svs.gt_500bp.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.DUP.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.DEL.bedpe.stix_sgdp',
        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp'
    shell:
        'gunzip cosmic/cosmic.DEL.bed.stix_1kg.gz;'
        'gunzip cosmic/cosmic.INVGRCh37.INV.bed.stix_1kg.gz;'
        'gunzip cosmic/cosmic.DUP.bed.stix_1kg.gz;'
        'gunzip cosmic/cosmic.INV.bed.stix_1kg.gz;'
        'gunzip pcawg/pcawg.svs.DEL.bedpe.stix_1kg.gz;'
        'gunzip pcawg/pcawg.svs.DUP.bedpe.stix_1kg.gz;'
        'gunzip pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg.gz;'
        'gunzip pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg.gz;'
        'gunzip denovo/dnsv.GRCh37.INV.bed.stix_1kg.gz;'
        'gunzip denovo/dnsv.GRCh37.DUP.bed.stix_1kg.gz;'
        'gunzip denovo/dnsv.GRCh37.DEL.bed.stix_1kg.gz;'
        'gunzip 1kg/1kg.INV.nonref_samples.bed.stix_1kg.gz;'
        'gunzip 1kg/1kg.DEL.nonref_samples.bed.stix_1kg.gz;'
        'gunzip 1kg/1kg.DUP.nonref_samples.bed.stix_1kg.gz;'
        'gunzip cosmic/cosmic.INV.bed.stix_sgdp.gz;'
        'gunzip cosmic/cosmic.DUP.bed.stix_sgdp.gz;'
        'gunzip cosmic/cosmic.DEL.bed.stix_sgdp.gz;'
        'gunzip pcawg/pcawg.svs.gt_500bp.bedpe.stix_sgdp.gz;'
        'gunzip pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp.gz;'
        'gunzip pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp.gz;'
        'gunzip pcawg/pcawg.svs.DUP.bedpe.stix_sgdp.gz;'
        'gunzip pcawg/pcawg.svs.DEL.bedpe.stix_sgdp.gz;'
        'gunzip denovo/dnsv.GRCh37.INV.bed.stix_sgdp.gz;'
        'gunzip denovo/dnsv.GRCh37.DEL.bed.stix_sgdp.gz;'
        'gunzip denovo/dnsv.GRCh37.DUP.bed.stix_sgdp.gz;'

rule onekg_gts:
    input:
        '1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz'
    output:
        '1kg/1kg.DEL.gts.bed',
        '1kg/1kg.DUP.gts.bed',
        '1kg/1kg.INV.gts.bed'
    shell:
        'bash src/get_1kg_gts.sh'

rule onekg_non_ref_samples:
    input:
        '1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz'
    output:
        '1kg/1kg.DUP.nonref_samples.bed',
        '1kg/1kg.DEL.nonref_samples.bed',
        '1kg/1kg.INV.nonref_samples.bed'
    shell:
        'bash src/get_1kg_non_ref_types.sh'

rule onekg_bedpes:
    input:
        '1kg/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz'
    output:
        '1kg/1kg.DUP.bedpe',
        '1kg/1kg.DEL.bedpe',
        '1kg/1kg.INV.bedpe'
    shell:
        'bash src/get_1kg_bedpes.sh'

rule onekg_classification_stats:
    input:
        '1kg/1kg.DUP.nonref_samples.bed.stix_1kg',
        '1kg/1kg.DEL.nonref_samples.bed.stix_1kg',
        '1kg/1kg.INV.nonref_samples.bed.stix_1kg'
    output:
        '1kg/1kg.DUP.stix_stats',
        '1kg/1kg.DEL.stix_stats',
        '1kg/1kg.INV.stix_stats'
    shell:
        'cat 1kg/1kg.DUP.nonref_samples.bed.stix_1kg | python src/get_stix_stats.py > 1kg/1kg.DUP.stix_stats;'
        'cat 1kg/1kg.DEL.nonref_samples.bed.stix_1kg | python src/get_stix_stats.py > 1kg/1kg.DEL.stix_stats;'
        'cat 1kg/1kg.INV.nonref_samples.bed.stix_1kg | python src/get_stix_stats.py > 1kg/1kg.INV.stix_stats'

rule onekg_sv_table:
    input:
        '1kg/1kg.DUP.stix_stats',
        '1kg/1kg.DEL.stix_stats',
        '1kg/1kg.INV.stix_stats'
    output:
        '1kg_sv_table.txt'
    shell:
        'bash src/get_1kg_sv_table.sh > 1kg_sv_table.txt'

rule cosmic_sv_beds:
    input:
        'cosmic/CosmicBreakpointsExport.tsv.gz'
    output:
        'cosmic/cosmic.DEL.bed.gz',
        'cosmic/cosmic.DUP.bed.gz',
        'cosmic/cosmic.INV.bed.gz'
    shell:
        'bash src/get_cosmic_svs.sh'

rule gnomad_sv_beds:
    input:
        'gnomad/gnomad_v2.1_sv.sites.bed.gz'
    output:
        'gnomad/gnomad.DEL.bed',
        'gnomad/gnomad.DUP.bed',
        'gnomad/gnomad.INV.bed'
    shell:
        'bash src/get_gnomad_svs.sh'

rule denovo_sv_beds:
    output:
        'denovo/dnsv.GRCh37.DEL.bed',
        'denovo/dnsv.GRCh37.DUP.bed',
        'denovo/dnsv.GRCh37.INV.bed'
    shell:
        'bash src/get_denovo_svs.sh'

rule denovo_1kg_overap:
    input:
        'denovo/dnsv.GRCh37.DEL.bed',
        'denovo/dnsv.GRCh37.DUP.bed',
        'denovo/dnsv.GRCh37.INV.bed',
        '1kg/1kg.DEL.gts.bed',
        '1kg/1kg.DUP.gts.bed',
        '1kg/1kg.INV.gts.bed'
    output:
        'denovo/dnsv.GRCh37.DEL.1kg.bed',
        'denovo/dnsv.GRCh37.DUP.1kg.bed',
        'denovo/dnsv.GRCh37.INV.1kg.bed',
    shell:
        'bash src/get_denovo_1kg_overlap.sh'

#rule denovo_stix_1kg_overlap:
#    input:
#        'denovo/dnsv.GRCh37.DEL.bed',
#        'denovo/dnsv.GRCh37.DUP.bed',
#        'denovo/dnsv.GRCh37.INV.bed'
#    output:
#        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg',
#        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg',
#        'denovo/dnsv.GRCh37.INV.bed.stix_1kg'
#    shell:
#        'bash src/get_denovo_stix_1kg_overlap.sh'

rule denovo_stix_1kg_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg',
        'denovo/dnsv.GRCh37.INV.bed.stix_1kg'
    output:
        'denovo/denovo.stix_1kg_stats'
    shell:
        'bash src/get_denovo_stix_1kg_overlap_stats.sh > denovo/denovo.stix_1kg_stats'

rule denovo_stix_1kg_hq_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg',
        'denovo/dnsv.GRCh37.INV.bed.stix_1kg'
    output:
        'denovo/denovo.stix_1kg_hq_stats'
    shell:
        'bash src/get_denovo_stix_1kg_hq_overlap_stats.sh > denovo/denovo.stix_1kg_hq_stats'

#rule denovo_stix_sgdp_overlap:
#    input:
#        'denovo/dnsv.GRCh37.DEL.bed',
#        'denovo/dnsv.GRCh37.DUP.bed',
#        'denovo/dnsv.GRCh37.INV.bed'
#    output:
#        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp',
#        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp',
#        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp'
#    shell:
#        'bash src/get_denovo_stix_sgdp_overlap.sh'

rule denovo_stix_sgdp_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp'
    output:
        'denovo/denovo.stix_sgdp_stats'
    shell:
        'bash src/get_denovo_stix_sgdp_overlap_stats.sh > denovo/denovo.stix_sgdp_stats'

rule denovo_stix_sgdp_hq_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp'
    output:
        'denovo/denovo.stix_sgdp_hq_stats'
    shell:
        'bash src/get_denovo_stix_sgdp_hq_overlap_stats.sh > denovo/denovo.stix_sgdp_hq_stats'

rule denovo_stix_1kg_sgdp_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg',
        'denovo/dnsv.GRCh37.INV.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp'
    output:
        'denovo/denovo.stix_1kg_sgdp_stats'
    shell:
        'bash src/get_denovo_stix_1kg_sgdp_overlap_stats.sh > denovo/denovo.stix_1kg_sgdp_stats'

rule denovo_stix_1kg_sgdp_hq_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DUP.bed.stix_1kg',
        'denovo/dnsv.GRCh37.INV.bed.stix_1kg',
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.DUP.bed.stix_sgdp',
        'denovo/dnsv.GRCh37.INV.bed.stix_sgdp'
    output:
        'denovo/denovo.stix_1kg_sgdp_hq_stats'
    shell:
        'bash src/get_denovo_stix_1kg_sgdp_hq_overlap_stats.sh > denovo/denovo.stix_1kg_sgdp_hq_stats'

rule denovo_1kg_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.1kg.bed',
        'denovo/dnsv.GRCh37.DUP.1kg.bed',
        'denovo/dnsv.GRCh37.INV.1kg.bed',
    output:
        'denovo/denovo.1kg_stats'
    shell:
        'bash src/get_denovo_1kg_overlap_stats.sh  > denovo/denovo.1kg_stats'

rule denovo_gnomad_overap:
    input:
        'denovo/dnsv.GRCh37.DEL.bed',
        'denovo/dnsv.GRCh37.DUP.bed',
        'denovo/dnsv.GRCh37.INV.bed',
        'gnomad/gnomad.DEL.bed',
        'gnomad/gnomad.DUP.bed',
        'gnomad/gnomad.INV.bed'
    output:
        'denovo/dnsv.GRCh37.DEL.gnomad.bed',
        'denovo/dnsv.GRCh37.DUP.gnomad.bed',
        'denovo/dnsv.GRCh37.INV.gnomad.bed',
    shell:
        'bash src/get_denovo_gnomad_overlap.sh'

rule denovo_gnomad_overlap_stats:
    input:
        'denovo/dnsv.GRCh37.DEL.gnomad.bed',
        'denovo/dnsv.GRCh37.DUP.gnomad.bed',
        'denovo/dnsv.GRCh37.INV.gnomad.bed',
    output:
        'denovo/denovo.gnomad_stats'
    shell:
        'bash src/get_denovo_gnomad_overlap_stats.sh  > denovo/denovo.gnomad_stats'

rule denovo_sv_table:
    input:
        'denovo/denovo.stix_sgdp_stats',
        'denovo/denovo.stix_1kg_stats',
        'denovo/denovo.stix_1kg_sgdp_stats',
        'denovo/denovo.1kg_stats',
        'denovo/denovo.gnomad_stats'
    output:
        'denovo_sv_table.txt'
    shell:
        'bash src/get_denovo_sv_table.sh > denovo_sv_table.txt'

rule denovo_sv_hq_table:
    input:
        'denovo/denovo.stix_sgdp_hq_stats',
        'denovo/denovo.stix_1kg_hq_stats',
        'denovo/denovo.stix_1kg_sgdp_hq_stats',
        'denovo/denovo.1kg_stats',
        'denovo/denovo.gnomad_stats'
    output:
        'denovo_sv_hq_table.txt'
    shell:
        'bash src/get_denovo_sv_hq_table.sh > denovo_sv_hq_table.txt'


rule denovo_stix_1kg_nz_depth_plot:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg'
    output:
        'denovo.DEL.bed.stix_1kg.{format}'
    shell:
        'cat denovo/dnsv.GRCh37.DEL.bed.stix_1kg'
        '| cut -f 5,6 '
        '| python src/scatter.py '
        ' -o {output} '
        ' --x_label "Num. samples with non-zero evidence" '
        ' --y_label "Max per-sample evidence depth" '
        ' --fig_x 3 '
        ' --fig_y 2 '
        ' --point_size 4 '
        ' --markeredgecolor C0  '
        ' --markerfacecolor C0 '
        ' --title "De novo vs 1KG;8;left" '

rule denovo_stix_sgdp_nz_depth_plot:
    input:
        'denovo/dnsv.GRCh37.DEL.bed.stix_sgdp'
    output:
        'denovo.DEL.bed.stix_sgdp.{format}'
    shell:
        'cat denovo/dnsv.GRCh37.DEL.bed.stix_sgdp'
        '| cut -f 5,6 '
        '| python src/scatter.py '
        ' -o {output} '
        ' --x_label "Num. samples with non-zero evidence" '
        ' --y_label "Max per-sample evidence depth" '
        ' --fig_x 3 '
        ' --fig_y 2 '
        ' --point_size 4 '
        ' --markeredgecolor C0  '
        ' --markerfacecolor C0 '
        ' --title "De novo vs SGDP;8;left" '

rule denovo_1kg_ac_stix_1kg_nz_plot:
    input:
        'denovo/dnsv.GRCh37.DEL.1kg.bed',
        'denovo/dnsv.GRCh37.DEL.bed.stix_1kg'
    output:
        'denovo_1kg_ac_stix_1kg_nz_plot.{format}'
    shell:
        'paste '
        '   <(cat denovo/dnsv.GRCh37.DEL.1kg.bed | bedtools sort -i stdin) '
        '   <(cat denovo/dnsv.GRCh37.DEL.bed.stix_1kg | cut -f1-7 | bedtools sort -i stdin) '
        '| cut -f 4,10 '
        "| awk '$1>0 || $2>0' "
        '| python src/scatter.py '
        '   -o {output} '
        '   --x_label "Num. non-ref samples in 1KG VCF" '
        '   --y_label "Num. 1KG samples with STIX evidnece" '
        '   --fig_x 3 '
        '   --fig_y 2 '
        '   --point_size 4 '
        '   --markeredgecolor C0  '
        '   --markerfacecolor C0 '
        '   --title "De novo in 1KG VCF and STIX 1KG Index;8;left" '

rule cosmic_1kg_overlap:
    input:
        'cosmic/cosmic.DEL.bed.gz',
        'cosmic/cosmic.DUP.bed.gz',
        'cosmic/cosmic.INV.bed.gz',
        '1kg/1kg.DEL.gts.bed',
        '1kg/1kg.DUP.gts.bed',
        '1kg/1kg.INV.gts.bed'
    output:
        'cosmic/cosmic.DEL.1kg.bed',
        'cosmic/cosmic.DUP.1kg.bed',
        'cosmic/cosmic.INV.1kg.bed'
    shell:
        'bash src/get_cosmic_1kg_overlap.sh'

rule cosmic_1kg_overlap_stats:
    input:
        'cosmic/cosmic.DEL.1kg.bed',
        'cosmic/cosmic.DUP.1kg.bed',
        'cosmic/cosmic.INV.1kg.bed'
    output:
        'cosmic/cosmic.1kg_stats'
    shell:
        'bash src/get_cosmic_1kg_overlap_stats.sh  > cosmic/cosmic.1kg_stats'

rule cosmic_gnomad_overlap:
    input:
        'cosmic/cosmic.DEL.bed.gz',
        'cosmic/cosmic.DUP.bed.gz',
        'cosmic/cosmic.INV.bed.gz',
        'gnomad/gnomad.DEL.bed',
        'gnomad/gnomad.DUP.bed',
        'gnomad/gnomad.INV.bed'
    output:
        'cosmic/cosmic.DEL.gnomad.bed',
        'cosmic/cosmic.DUP.gnomad.bed',
        'cosmic/cosmic.INV.gnomad.bed'
    shell:
        'bash src/get_cosmic_gnomad_overlap.sh'

rule cosmic_gnomad_overlap_stats:
    input:
        'cosmic/cosmic.DEL.gnomad.bed',
        'cosmic/cosmic.DUP.gnomad.bed',
        'cosmic/cosmic.INV.gnomad.bed'
    output:
        'cosmic/cosmic.gnomad_stats'
    shell:
        'bash src/get_cosmic_gnomad_overlap_stats.sh  > cosmic/cosmic.gnomad_stats'

#rule cosmic_stix_1kg_overlap:
#    input:
#        'cosmic/cosmic.DEL.bed.gz',
#        'cosmic/cosmic.DUP.bed.gz',
#        'cosmic/cosmic.INV.bed.gz',
#    output:
#        'cosmic/cosmic.DEL.bed.stix_1kg',
#        'cosmic/cosmic.DUP.bed.stix_1kg',
#        'cosmic/cosmic.INV.bed.stix_1kg'
#    shell:
#        'bash src/get_cosmic_stix_1kg_overlap.sh'

rule cosmic_stix_1kg_overlap_stats:
    input:
        'cosmic/cosmic.DEL.bed.stix_1kg',
        'cosmic/cosmic.DUP.bed.stix_1kg',
        'cosmic/cosmic.INV.bed.stix_1kg'
    output:
        'cosmic/cosmic.stix_1kg_stats'
    shell:
        'bash src/get_cosmic_stix_1kg_overlap_stats.sh > cosmic/cosmic.stix_1kg_stats'

#rule cosmic_stix_sgdp_overlap:
#    input:
#        'cosmic/cosmic.DEL.bed.gz',
#        'cosmic/cosmic.DUP.bed.gz',
#        'cosmic/cosmic.INV.bed.gz',
#    output:
#        'cosmic/cosmic.DEL.bed.stix_sgdp',
#        'cosmic/cosmic.DUP.bed.stix_sgdp',
#        'cosmic/cosmic.INV.bed.stix_sgdp'
#    shell:
#        'bash src/get_cosmic_stix_sgdp_overlap.sh'

rule cosmic_stix_sgdp_overlap_stats:
    input:
        'cosmic/cosmic.DEL.bed.stix_sgdp',
        'cosmic/cosmic.DUP.bed.stix_sgdp',
        'cosmic/cosmic.INV.bed.stix_sgdp'
    output:
        'cosmic/cosmic.stix_sgdp_stats'
    shell:
        'bash src/get_cosmic_stix_sgdp_overlap_stats.sh > cosmic/cosmic.stix_sgdp_stats'

rule cosmic_stix_1kg_sgdp_overlap_stats:
    input:
        'cosmic/cosmic.DEL.bed.stix_sgdp',
        'cosmic/cosmic.DUP.bed.stix_sgdp',
        'cosmic/cosmic.INV.bed.stix_sgdp',
        'cosmic/cosmic.DEL.bed.stix_1kg',
        'cosmic/cosmic.DUP.bed.stix_1kg',
        'cosmic/cosmic.INV.bed.stix_1kg'
    output:
        'cosmic/cosmic.stix_1kg_sgdp_stats'
    shell:
        'bash src/get_cosmic_stix_1kg_sgdp_overlap_stats.sh > cosmic/cosmic.stix_1kg_sgdp_stats'

rule cosmic_sv_table:
    input:
        'cosmic/cosmic.stix_sgdp_stats',
        'cosmic/cosmic.stix_1kg_stats',
        'cosmic/cosmic.stix_1kg_sgdp_stats',
        'cosmic/cosmic.1kg_stats',
        'cosmic/cosmic.gnomad_stats'
    output:
        'cosmic_sv_table.txt'
    shell:
        'bash src/get_cosmic_sv_table.sh > cosmic_sv_table.txt'

rule cosmic_stix_1kg_nz_depth_plot:
    input:
        'cosmic/cosmic.DEL.bed.stix_1kg'
    output:
        'cosmic.DEL.bed.stix_1kg.{format}'
    shell:
        'cat cosmic/cosmic.DEL.bed.stix_1kg '
        '| cut -f 5,6 '
        "| awk '$1>0' " 
        '| python src/scatter.py '
        ' -o {output} '
        ' --x_label "Num. samples with non-zero evidence" '
        ' --y_label "Max per-sample evidence depth" '
        ' --fig_x 3 '
        ' --fig_y 2 '
        ' --point_size 4 '
        ' --markeredgecolor C0  '
        ' --markerfacecolor C0 '
        ' --title "COSMIC vs 1KG;8;left" '

rule cosmic_stix_sgdp_nz_depth_plot:
    input:
        'cosmic/cosmic.DEL.bed.stix_sgdp'
    output:
        'cosmic.DEL.bed.stix_sgdp.{format}'
    shell:
        'cat cosmic/cosmic.DEL.bed.stix_sgdp '
        '| cut -f 5,6 '
        "| awk '$1>0' " 
        '| python src/scatter.py '
        ' -o {output} '
        ' --x_label "Num. samples with non-zero evidence" '
        ' --y_label "Max per-sample evidence depth" '
        ' --fig_x 3 '
        ' --fig_y 2 '
        ' --point_size 4 '
        ' --markeredgecolor C0  '
        ' --markerfacecolor C0 '
        ' --title "COSMIC vs SGDP;8;left" '

rule cosmic_1kg_ac_stix_1kg_nz_plot:
    input:
        'cosmic/cosmic.DEL.1kg.bed',
        'cosmic/cosmic.DEL.bed.stix_1kg'
    output:
        'cosmic_1kg_ac_stix_1kg_nz_plot.{format}'
    shell:
        'paste '
        '   <( cat cosmic/cosmic.DEL.1kg.bed | bedtools sort -i stdin ) '
        '   <( cat cosmic/cosmic.DEL.bed.stix_1kg | cut -f 1-7 | bedtools sort -i stdin) '
        '| cut -f 5,10 '
        "| awk '$1>0 || $2>0' "
        '| python src/scatter.py '
        '   -o {output} '
        '   --x_label "Num. non-ref samples in 1KG VCF" '
        '   --y_label "Num. 1KG samples with STIX evidnece" '
        '   --fig_x 3 '
        '   --fig_y 2 '
        '   --point_size 4 '
        '   --markeredgecolor C0  '
        '   --markerfacecolor C0 '
        '   --title "COSMIC in 1KG VCF and STIX 1KG Index;8;left" '

rule pcawg_sv_bedpes:
    output:
        'pcawg/pcawg.svs.DEL.bedpe',
        'pcawg/pcawg.svs.DUP.bedpe',
        'pcawg/pcawg.svs.h2hINV.bedpe',
        'pcawg/pcawg.svs.t2tINV.bedpe',
        'pcawg/pcawg.svs.DEL.bed',
        'pcawg/pcawg.svs.DUP.bed',
        'pcawg/pcawg.svs.h2hINV.bed',
        'pcawg/pcawg.svs.t2tINV.bed'
    shell:
        'bash src/get_pcawg_svs.sh'

rule pcawg_1kg_overlap:
    input:
        'pcawg/pcawg.svs.DEL.bed',
        'pcawg/pcawg.svs.DUP.bed',
        'pcawg/pcawg.svs.h2hINV.bed',
        'pcawg/pcawg.svs.t2tINV.bed',
        '1kg/1kg.DEL.gts.bed',
        '1kg/1kg.DUP.gts.bed',
        '1kg/1kg.INV.gts.bed'
    output:
        'pcawg/pcawg.DEL.1kg.bed',
        'pcawg/pcawg.DUP.1kg.bed',
        'pcawg/pcawg.h2hINV.1kg.bed',
        'pcawg/pcawg.t2tINV.1kg.bed'
    shell:
        'bash src/get_pcawg_1kg_overlap.sh'

rule pcawg_1kg_overlap_stats:
    input:
        'pcawg/pcawg.DEL.1kg.bed',
        'pcawg/pcawg.DUP.1kg.bed',
        'pcawg/pcawg.h2hINV.1kg.bed',
        'pcawg/pcawg.t2tINV.1kg.bed'
    output:
        'pcawg/pcawg.1kg_stats'
    shell:
        'bash src/get_pcawg_1kg_overlap_stats.sh  > pcawg/pcawg.1kg_stats'

rule pcawg_gnomad_overlap:
    input:
        'pcawg/pcawg.svs.DEL.bed',
        'pcawg/pcawg.svs.DUP.bed',
        'pcawg/pcawg.svs.h2hINV.bed',
        'pcawg/pcawg.svs.t2tINV.bed',
        'gnomad/gnomad.DEL.bed',
        'gnomad/gnomad.DUP.bed',
        'gnomad/gnomad.INV.bed'
    output:
        'pcawg/pcawg.svs.DEL.gnomad.bed',
        'pcawg/pcawg.svs.DUP.gnomad.bed',
        'pcawg/pcawg.svs.h2hINV.gnomad.bed',
        'pcawg/pcawg.svs.t2tINV.gnomad.bed'
    shell:
        'bash src/get_pcawg_gnomad_overlap.sh'

rule pcawg_gnomad_overlap_stats:
    input:
        'pcawg/pcawg.svs.DEL.gnomad.bed',
        'pcawg/pcawg.svs.DUP.gnomad.bed',
        'pcawg/pcawg.svs.h2hINV.gnomad.bed',
        'pcawg/pcawg.svs.t2tINV.gnomad.bed'
    output:
        'pcawg/pcawg.gnomad_stats'
    shell:
        'bash src/get_pcawg_gnomad_overlap_stats.sh  > pcawg/pcawg.gnomad_stats'

rule pcawg_stix_1kg_overlap_stats:
    input:
        'pcawg/pcawg.svs.DEL.bedpe.stix_1kg',
        'pcawg/pcawg.svs.DUP.bedpe.stix_1kg',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg'
    output:
        'pcawg/pcawg.stix_1kg_stats'
    shell:
        'bash src/get_pcawg_stix_1kg_overlap_stats.sh > pcawg/pcawg.stix_1kg_stats'

rule pcawg_stix_sgdp_overlap_stats:
    input:
        'pcawg/pcawg.svs.DEL.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.DUP.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp'
    output:
        'pcawg/pcawg.stix_sgdp_stats'
    shell:
        'bash src/get_pcawg_stix_sgdp_overlap_stats.sh > pcawg/pcawg.stix_sgdp_stats'

rule pcawg_stix_1kg_sgdp_overlap_stats:
    input:
        'pcawg/pcawg.svs.DEL.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.DUP.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_sgdp',
        'pcawg/pcawg.svs.DEL.bedpe.stix_1kg',
        'pcawg/pcawg.svs.DUP.bedpe.stix_1kg',
        'pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg',
        'pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg'
    output:
        'pcawg/pcawg.stix_1kg_sgdp_stats'
    shell:
        'bash src/get_pcawg_stix_1kg_sgdp_overlap_stats.sh > pcawg/pcawg.stix_1kg_sgdp_stats'

rule pcawg_sv_table:
    input:
        'pcawg/pcawg.stix_sgdp_stats',
        'pcawg/pcawg.stix_1kg_stats',
        'pcawg/pcawg.stix_1kg_sgdp_stats',
        'pcawg/pcawg.1kg_stats',
        'pcawg/pcawg.gnomad_stats'
    output:
        'pcawg_sv_table.txt'
    shell:
        'bash src/get_pcawg_sv_table.sh > pcawg_sv_table.txt'

rule pcawg_stix_1kg_nz_depth_plot:
    input:
        'pcawg/pcawg.svs.DEL.bedpe.stix_1kg'
    output:
        'pcawg.DEL.bed.stix_1kg.{format}'
    shell:
        'cat pcawg/pcawg.svs.DEL.bedpe.stix_1kg'
        '| cut -f 13,14 '
        "| awk '$1>0' " 
        '| python src/scatter.py '
        ' -o {output} '
        ' --x_label "Num. samples with non-zero evidence" '
        ' --y_label "Max per-sample evidence depth" '
        ' --fig_x 3 '
        ' --fig_y 2 '
        ' --point_size 4 '
        ' --markeredgecolor C0  '
        ' --markerfacecolor C0 '
        ' --title "PCAWG vs 1KG;8;left" '

rule pcawg_stix_sgdp_nz_depth_plot:
    input:
        'pcawg/pcawg.svs.DEL.bedpe.stix_sgdp'
    output:
        'pcawg.DEL.bed.stix_sgdp.{format}'
    shell:
        'cat pcawg/pcawg.svs.DEL.bedpe.stix_sgdp'
        '| cut -f 13,14 '
        "| awk '$1>0' " 
        '| python src/scatter.py '
        ' -o {output} '
        ' --x_label "Num. samples with non-zero evidence" '
        ' --y_label "Max per-sample evidence depth" '
        ' --fig_x 3 '
        ' --fig_y 2 '
        ' --point_size 4 '
        ' --markeredgecolor C0  '
        ' --markerfacecolor C0 '
        ' --title "PCAWG vs SGDP;8;left" '

rule pcawg_1kg_ac_stix_1kg_nz_plot:
    input:
        'pcawg/pcawg.DEL.1kg.bed',
        'pcawg/pcawg.svs.DEL.bedpe.stix_1kg'
    output:
        'pcawg_1kg_ac_stix_1kg_nz_plot.{format}'
    shell:
        'paste '
        '   <( cat pcawg/pcawg.DEL.1kg.bed | sort | bedtools groupby -i stdin -g 1,2,3 -c 4,5 -ops max,max | bedtools sort -i stdin) '
        '   <( cat pcawg/pcawg.svs.DEL.bedpe.stix_1kg | cut -f 1,2,6,13,14,15| bedtools sort -i stdin) '
        '| cut -f 4,9 '
        "| awk '$1>0 || $2>0' "
        '| python src/scatter.py '
        '   -o {output} '
        '   --x_label "Num. non-ref samples in 1KG VCF" '
        '   --y_label "Num. 1KG samples with STIX evidnece" '
        '   --fig_x 3 '
        '   --fig_y 2 '
        '   --point_size 4 '
        '   --markeredgecolor C0  '
        '   --markerfacecolor C0 '
        '   --title "PCAWG in 1KG VCF and STIX 1KG Index;8;left" '
