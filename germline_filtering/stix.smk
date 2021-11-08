import subprocess
import numpy as np
import pandas as pd
from pathlib import Path


### Setup
###############################################################################
outdir = config['outdir']

# it's hs37d5 from the 1000 genomes project
reference = config['reference']

# put the base location in a config
# or create a rule to download the base data
icgc_bedpe_dir = config['icgc_bedpe_dir']

# table containing donor ids, file ids, specimen types, etc.
donor_table = pd.read_csv(config['donor_table'], sep='\t')

# file id => bam sample name
fileid2sample = {
    line.split()[0] : line.split()[1]
    for line in open(config['sample_names']).readlines()}   

# list the files in manta-tumour-normal somaticSV vcfs
file_listing = subprocess.check_output(                                                                                                                                   
    ['aws s3 ls s3://layerlabcu/icgc/manta-tumour-normal/'], shell=True,)
tumour_file_ids = list(set(
    line.split()[3].split('.')[0]                                                                                                                      
    for line in file_listing.decode().rstrip().split('\n')))

### Rules
###############################################################################
rule All:
    input:
        f'{outdir}/stats_report.tsv'
        f'{outdir}/dup_stats_report.tsv',
        f'{outdir}/inv_stats_report.tsv',


################################################################################
## pull manta VCFs from s3
################################################################################
rule GetSingleSampleVCFs:
    """
    get the single sample mode manta vcfs from s3
    """
    output:
        f'{outdir}/single_sample_vcf/{{fid}}-manta.vcf.gz'
    shell:
        """
        aws s3 cp s3://layerlabcu/icgc/manta.2/{wildcards.fid}-manta.vcf.gz {output}
        """

rule GetSomaticVCFs:
    """
    get the somaticSV vcfs from s3
    """
    output:
        f'{outdir}/somaticSV/{{fid}}.somaticSV.vcf.gz'
    shell:
        """
        aws s3 cp s3://layerlabcu/icgc/manta-tumour-normal/{wildcards.fid}.somaticSV.vcf.gz {output}
        """

################################################################################
## Get the manta sv calls for each SV type
################################################################################
rule GetSomaticDels:
    """
    From the manta tumour-normal calls, extract DEL regions into a bed.
    NOTE: the somatic vcf doesn't have genotypes, so presumably all the regions are variants
    """
    input:
        rules.GetSomaticVCFs.output
    output:
        f'{outdir}/somaticSV/{{fid}}.somaticSV.del.bed'
    conda:
        'envs/samtools.yaml'
    shell:
        """
        bcftools query -i 'SVTYPE="DEL"' -f '%CHROM\t%POS\t%INFO/END\n' {input} > {output}
        """
rule GetSingleSampleDels:
    input:
        rules.GetSingleSampleVCFs.output
    output:
        f'{outdir}/single_sample_vcf/{{fid}}.del.vcf.gz'
    conda:
        'envs/pysam.yaml'
    shell:
        'python3 scripts/get_dels.py {input} | bgzip -c > {output}'

rule GetSomaticInversions:
    # convert to single line then get inversions
    input:
        vcf = rules.GetSomaticVCFs.output,
        fasta = reference
    output:
        f'{outdir}/somaticSV/{{fid}}.somaticSV.inv.bed'
    conda:
        'envs/samtools.yaml'
    shell:
        """
        python2 scripts/convertInversion.py $(which samtools) {input.fasta} {input.vcf} |
        bcftools query -i 'SVTYPE="INV"' -f '%CHROM\t%POS\t%INFO/END\n' > {output}
        """
rule ConvertSingleSampleInversions:
    """
    convert single region inversion representation
    """
    input:
        vcf = rules.GetSingleSampleVCFs.output,
        fasta = reference
    output:
        temp(f'{outdir}/single_sample_vcf/{{fid}}.converted.vcf.gz')
    conda:
        'envs/samtools.yaml'
    shell:
        """
        python2 scripts/convertInversion.py $(which samtools) {input.fasta} {input.vcf} |
        bgzip -c > {output}
        """
rule GetSingleSampleInversions:
    input:
        rules.ConvertSingleSampleInversions.output,
    output:
        f'{outdir}/single_sample_vcf/{{fid}}.inv.vcf.gz'
    conda:
        'envs/pysam.yaml'
    shell:
        """
        python3 scripts/get_dels.py {input} INV | bgzip -c > {output}
        """

rule GetSingleSampleDups:
    input:
        rules.GetSingleSampleVCFs.output
    output:
        f'{outdir}/single_sample_vcf/{{fid}}.dup.vcf.gz'
    conda:
        'envs/pysam.yaml'
    shell:
        'python3 scripts/get_dels.py {input} DUP | bgzip -c > {output}'

rule GetSomaticDups:
    input:
        rules.GetSomaticVCFs.output
    output:
        f'{outdir}/somaticSV/{{fid}}.somaticSV.dup.bed'
    conda:
        'envs/samtools.yaml'
    shell:
        """
        bcftools query -i 'SVTYPE="DUP"' -f '%CHROM\t%POS\t%INFO/END\n' {input} > {output}
        """


################################################################################
## Stix queries
################################################################################
rule StixQuerySingleSample: #DELs
    threads:
        workflow.cores
    input:
        rules.GetSingleSampleDels.output
    output:
        f'{outdir}/bed/{{fid}}.stix.single_sample.bed'
    conda:
        'envs/pysam.yaml'
    shell:
        """
        bash scripts/stix_cmd.sh {input} {output} {threads} DEL
        """
rule StixQuerySingleSampleDups:
    threads:
        workflow.cores
    input:
        rules.GetSingleSampleDups.output
    output:
        f'{outdir}/bed/{{fid}}.stix.single_sample.dup.bed'
    conda:
        'envs/pysam.yaml'
    shell:
        """
        bash scripts/stix_cmd.sh {input} {output} {threads} DUP
        """
rule StixQuerySingleSampleInvs:
    threads:
        workflow.cores
    input:
        rules.GetSingleSampleInversions.output
    output:
        f'{outdir}/bed/{{fid}}.stix.single_sample.inv.bed'
    conda:
        'envs/pysam.yaml'
    shell:
        """
        bash scripts/stix_cmd.sh {input} {output} {threads} INV
        """

################################################################################
## get ICGC truth set SVs
################################################################################
rule GetIcgcSampleDels:
    """
    get del regions for a given sample from the icgc bedpe
    svclass = column 11
    """
    input:
        lambda w: f'{icgc_bedpe_dir}/{fileid2sample[w.fid]}.pcawg_consensus_1.6.161116.somatic.sv.bedpe.gz'
    output:
        f'{outdir}/icgc_bed/{{fid}}.del.bed'
    shell:
        f"""
        mkdir -p {outdir}/icgc_bed
        bash scripts/icgc_bedpe2bed.sh {{input}} {{output}} DEL
        """
rule GetIcgcSampleDups:
    input:
        lambda w: f'{icgc_bedpe_dir}/{fileid2sample[w.fid]}.pcawg_consensus_1.6.161116.somatic.sv.bedpe.gz'
    output:
        f'{outdir}/icgc_bed/{{fid}}.dup.bed'
    shell:
        f"""
        mkdir -p {outdir}/icgc_bed
        bash scripts/icgc_bedpe2bed.sh {{input}} {{output}} DUP
        """
rule GetIcgcSampleInvs:
    input:
        lambda w: f'{icgc_bedpe_dir}/{fileid2sample[w.fid]}.pcawg_consensus_1.6.161116.somatic.sv.bedpe.gz'
    output:
        f'{outdir}/icgc_bed/{{fid}}.inv.bed'
    shell:
        f"""
        mkdir -p {outdir}/icgc_bed
        bash scripts/icgc_bedpe2bed.sh {{input}} {{output}} INV
        """

################################################################################
## Filtering operations
################################################################################
rule ThresholdCalledRegions: # DELS
    """
    filter out called del regions with:
    - gt 0 stix hits
    - gt 1 stix hits
    output to separate bed files
    """
    input:
        rules.StixQuerySingleSample.output
    output:
        gt0_bed = f'{outdir}/thresholded/{{fid}}.gt0.stix.bed',
        gt1_bed = f'{outdir}/thresholded/{{fid}}.gt1.stix.bed'
    shell:
        f"""
        mkdir -p {outdir}/thresholded
        bash scripts/threshold_called_regions.sh {{input}} {{output.gt0_bed}} 0
        bash scripts/threshold_called_regions.sh {{input}} {{output.gt1_bed}} 1
        """
rule ThresholdDupRegions:
    """
    filter out called dup regions with:
    - gt 0 stix hits
    - gt 1 stix hits
    output to separate bed files
    """
    input:
        rules.StixQuerySingleSampleDups.output
    output:
        gt0_bed = f'{outdir}/thresholded_dup/{{fid}}.dup.gt0.stix.bed',
        gt1_bed = f'{outdir}/thresholded_dup/{{fid}}.dup.gt1.stix.bed'
    shell:
        f"""
        mkdir -p {outdir}/thresholded_dup
        bash scripts/threshold_called_regions.sh {{input}} {{output.gt0_bed}} 0
        bash scripts/threshold_called_regions.sh {{input}} {{output.gt1_bed}} 1
        """
rule ThresholdInvRegions:
    """
    filter out called inv regions with:
    - gt 0 stix hits
    - gt 1 stix hits
    output to separate bed files
    """
    input:
        rules.StixQuerySingleSampleInvs.output
    output:
        gt0_bed = f'{outdir}/thresholded_inv/{{fid}}.inv.gt0.stix.bed',
        gt1_bed = f'{outdir}/thresholded_inv/{{fid}}.inv.gt1.stix.bed'
    shell:
        f"""
        mkdir -p {outdir}/thresholded_inv
        bash scripts/threshold_called_regions.sh {{input}} {{output.gt0_bed}} 0
        bash scripts/threshold_called_regions.sh {{input}} {{output.gt1_bed}} 1
        """

rule SubtractGnomadRegions:
    """
    remove regions in the sv callset that overlap with gnomad
    """
    input:
        stix_bed = rules.StixQuerySingleSample.output,
        gnomad_bed = config['gnomad_del_bed']
    output:
        f'{outdir}/gnomad_subtracted/{{fid}}.gnomad_subtracted.del.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/gnomad_subtracted
        bedtools intersect -v -r -f 0.9 -a {{input.stix_bed}} -b {{input.gnomad_bed}} |
            grep -v hs | grep -v GL | grep -v X | grep -v Y > {{output}}
        """
rule SubtractGnomadDups:
    """
    remove regions in the sv callset that overlap with gnomad dups
    """
    input:
        stix_bed = rules.StixQuerySingleSampleDups.output,
        gnomad_bed = config['gnomad_dup_bed']
    output:
        f'{outdir}/gnomad_subtracted_dup/{{fid}}.gnomad_subtracted.dup.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/gnomad_subtracted_dup
        bedtools intersect -v -r -f 0.9 -a {{input.stix_bed}} -b {{input.gnomad_bed}} |
            grep -v hs | grep -v GL | grep -v X | grep -v Y > {{output}}
        """
rule SubtractGnomadInvs:
    """
    remove regions in the sv callset that overlap with gnomad invs
    """
    input:
        stix_bed = rules.StixQuerySingleSampleInvs.output,
        gnomad_bed = config['gnomad_inv_bed']
    output:
        f'{outdir}/gnomad_subtracted_inv/{{fid}}.gnomad_subtracted.inv.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/gnomad_subtracted_inv
        bedtools intersect -v -r -f 0.9 -a {{input.stix_bed}} -b {{input.gnomad_bed}} |
            grep -v hs | grep -v GL | grep -v X | grep -v Y > {{output}}
        """

rule Subtract1kgDelRegions:
    """
    remove regions in the sv callset that overlap with 1kg dels
    """
    input:
        stix_bed = rules.StixQuerySingleSample.output,
        onekg_bedpe = '/home/much8161/data/stix/1kg/1kg.DEL.bedpe' # TODO don't hardcode
    output:
        f'{outdir}/1kg_subtracted/{{fid}}.1kg_subtracted.del.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/1kg_subtracted
        bash scripts/sub_1kg_dels.sh {{input.stix_bed}} {{input.onekg_bedpe}} {{output}}
        """
rule Subtract1kgDups:
    """
    remove regions in the sv callset that overlap with 1kg dups
    """
    input:
        stix_bed = rules.StixQuerySingleSampleInvs.output,
        onekg_bed = config['onekg_dup_bed']
    output:
        f'{outdir}/1kg_subtracted_dup/{{fid}}.1kg_subtracted.dup.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/1kg_subtracted_dup
        bedtools intersect -v -r -f 0.9 -a {{input.stix_bed}} -b {{input.onekg_bed}} |
            grep -v hs | grep -v GL | grep -v X | grep -v Y > {{output}}
        """
rule Subtract1kgInvs:
    """
    remove regions in the sv callset that overlap with 1kg Invs
    """
    input:
        stix_bed = rules.StixQuerySingleSampleInvs.output,
        onekg_bed = config['onekg_inv_bed']
    output:
        f'{outdir}/1kg_subtracted_inv/{{fid}}.1kg_subtracted.inv.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/1kg_subtracted_inv
        bedtools intersect -v -r -f 0.9 -a {{input.stix_bed}} -b {{input.onekg_bed}} |
            grep -v hs | grep -v GL | grep -v X | grep -v Y > {{output}}
        """
    
    
################################################################################
## Truth set evaluation    
################################################################################
rule IntersectICGC:
    """
    Intersect the thresholded SV calls with ICGC truth regions
    """
    input:
        gt0_bed = rules.ThresholdCalledRegions.output.gt0_bed,
        gt1_bed = rules.ThresholdCalledRegions.output.gt1_bed,
        manta_somatic_bed = rules.GetSomaticDels.output,
        gnomad_sub_bed = rules.SubtractGnomadRegions.output,
        onekg_sub_bed = rules.Subtract1kgDelRegions.output,
        icgc_bed = rules.GetIcgcSampleDels.output
    output:
        gt0_icgc = f'{outdir}/intersections/{{fid}}.gt0.icgc.del.bed',
        gt1_icgc = f'{outdir}/intersections/{{fid}}.gt1.icgc.del.bed',
        manta_somatic_icgc = f'{outdir}/intersections/{{fid}}.manta-tumour-normal.icgc.del.bed',
        gnomad_icgc = f'{outdir}/intersections/{{fid}}.gnomad-sub.icgc.del.bed',
        onekg_icgc = f'{outdir}/intersections/{{fid}}.1kg-sub.icgc.del.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/intersections
        bash scripts/intersect_icgc.sh {{input.gt0_bed}} {{input.icgc_bed}} {{output.gt0_icgc}}
        bash scripts/intersect_icgc.sh {{input.gt1_bed}} {{input.icgc_bed}} {{output.gt1_icgc}}
        bash scripts/intersect_icgc.sh {{input.manta_somatic_bed}} {{input.icgc_bed}} {{output.manta_somatic_icgc}}
        bash scripts/intersect_icgc.sh {{input.gnomad_sub_bed}} {{input.icgc_bed}} {{output.gnomad_icgc}}
        bash scripts/intersect_icgc.sh {{input.onekg_sub_bed}} {{input.icgc_bed}} {{output.onekg_icgc}}
        """
rule IntersectICGCDups:
    """
    Intersect the thresholded SV calls with ICGC truth regions
    """
    input:
        gt0_bed = rules.ThresholdDupRegions.output.gt0_bed,
        gt1_bed = rules.ThresholdDupRegions.output.gt1_bed,
        manta_somatic_bed = rules.GetSomaticDups.output,
        gnomad_sub_bed = rules.SubtractGnomadDups.output,
        onekg_sub_bed = rules.Subtract1kgDups.output,
        icgc_bed = rules.GetIcgcSampleDups.output
    output:
        gt0_icgc = f'{outdir}/intersections_dup/{{fid}}.gt0.icgc.dup.bed',
        gt1_icgc = f'{outdir}/intersections_dup/{{fid}}.gt1.icgc.dup.bed',
        manta_somatic_icgc = f'{outdir}/intersections_dup/{{fid}}.manta-tumour-normal.icgc.dup.bed',
        gnomad_icgc = f'{outdir}/intersections_dup/{{fid}}.gnomad-sub.icgc.dup.bed',
        onekg_icgc = f'{outdir}/intersections_dup/{{fid}}.1kg-sub.icgc.dup.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/intersections_dup
        bash scripts/intersect_icgc.sh {{input.gt0_bed}} {{input.icgc_bed}} {{output.gt0_icgc}}
        bash scripts/intersect_icgc.sh {{input.gt1_bed}} {{input.icgc_bed}} {{output.gt1_icgc}}
        bash scripts/intersect_icgc.sh {{input.manta_somatic_bed}} {{input.icgc_bed}} {{output.manta_somatic_icgc}}
        bash scripts/intersect_icgc.sh {{input.gnomad_sub_bed}} {{input.icgc_bed}} {{output.gnomad_icgc}}
        bash scripts/intersect_icgc.sh {{input.onekg_sub_bed}} {{input.icgc_bed}} {{output.onekg_icgc}}
        """
rule IntersectICGCInvs:
    """
    Intersect the thresholded SV calls with ICGC truth regions
    """
    input:
        gt0_bed = rules.ThresholdInvRegions.output.gt0_bed,
        gt1_bed = rules.ThresholdInvRegions.output.gt1_bed,
        manta_somatic_bed = rules.GetSomaticInversions.output,
        gnomad_sub_bed = rules.SubtractGnomadInvs.output,
        onekg_sub_bed = rules.Subtract1kgInvs.output,
        icgc_bed = rules.GetIcgcSampleInvs.output
    output:
        gt0_icgc = f'{outdir}/intersections_inv/{{fid}}.gt0.icgc.inv.bed',
        gt1_icgc = f'{outdir}/intersections_inv/{{fid}}.gt1.icgc.inv.bed',
        manta_somatic_icgc = f'{outdir}/intersections_inv/{{fid}}.manta-tumour-normal.icgc.inv.bed',
        gnomad_icgc = f'{outdir}/intersections_inv/{{fid}}.gnomad-sub.icgc.inv.bed',
        onekg_icgc = f'{outdir}/intersections_inv/{{fid}}.1kg-sub.icgc.inv.bed'
    conda:
        'envs/bedtools.yaml'
    shell:
        f"""
        mkdir -p {outdir}/intersections_inv
        bash scripts/intersect_icgc.sh {{input.gt0_bed}} {{input.icgc_bed}} {{output.gt0_icgc}}
        bash scripts/intersect_icgc.sh {{input.gt1_bed}} {{input.icgc_bed}} {{output.gt1_icgc}}
        bash scripts/intersect_icgc.sh {{input.manta_somatic_bed}} {{input.icgc_bed}} {{output.manta_somatic_icgc}}
        bash scripts/intersect_icgc.sh {{input.gnomad_sub_bed}} {{input.icgc_bed}} {{output.gnomad_icgc}}
        bash scripts/intersect_icgc.sh {{input.onekg_sub_bed}} {{input.icgc_bed}} {{output.onekg_icgc}}
        """

rule GetStats:
    """
    compile statistics from all the intersections compared against
    the truth set and the orignal call sets
    * format is: fid,method,TP,FP,TN,FN (sep='\t')
    """
    input:
        unfiltered = f'{outdir}/bed/{{fid}}.stix.single_sample.bed',
        filtered_gt0 = f'{outdir}/thresholded/{{fid}}.gt0.stix.bed',
        filtered_gt1 = f'{outdir}/thresholded/{{fid}}.gt1.stix.bed',
        filtered_manta_tn = f'{outdir}/somaticSV/{{fid}}.somaticSV.del.bed',
        filtered_gnomad = f'{outdir}/gnomad_subtracted/{{fid}}.gnomad_subtracted.del.bed',
        filtered_1kg = f'{outdir}/1kg_subtracted/{{fid}}.1kg_subtracted.del.bed',
        truth_set = f'{outdir}/icgc_bed/{{fid}}.del.bed',
        tp_gt0 = f'{outdir}/intersections/{{fid}}.gt0.icgc.del.bed',
        tp_gt1 = f'{outdir}/intersections/{{fid}}.gt0.icgc.del.bed',
        tp_manta_tn = f'{outdir}/intersections/{{fid}}.manta-tumour-normal.icgc.del.bed',
        tp_gnomad = f'{outdir}/intersections/{{fid}}.gnomad-sub.icgc.del.bed',
        tp_1kg = f'{outdir}/intersections/{{fid}}.1kg-sub.icgc.del.bed'
    output:
        temp(f'{outdir}/{{fid}}.stats.tsv')
    shell:
        """
        python3 scripts/calculate_stats.py \\
            --fid {wildcards.fid} \\
            --unfiltered {input.unfiltered} \\
            --filtered_gt0 {input.filtered_gt0} \\
            --filtered_gt1 {input.filtered_gt1} \\
            --filtered_manta_tn {input.filtered_manta_tn} \\
            --filtered_gnomad {input.filtered_gnomad} \\
            --filtered_1kg {input.filtered_1kg} \\
            --truth_set {input.truth_set} \\
            --tp_gt0 {input.tp_gt0} \\
            --tp_gt1 {input.tp_gt1} \\
            --tp_manta_tn {input.tp_manta_tn} \\
            --tp_gnomad {input.tp_gnomad} \\
            --tp_1kg {input.tp_gnomad} > {output}
        """
rule GetDupStats:
    """
    compile dup statistics from all the intersections compared against
    the truth set and the orignal call sets
    * format is: fid,method,TP,FP,TN,FN (sep='\t')
    """
    input:
        unfiltered = rules.StixQuerySingleSampleDups.output,
        filtered_gt0 = rules.ThresholdDupRegions.output.gt0_bed,
        filtered_gt1 = rules.ThresholdDupRegions.output.gt1_bed,
        filtered_manta_tn = rules.GetSomaticDups.output,
        filtered_gnomad = rules.SubtractGnomadDups.output,
        filtered_1kg = rules.Subtract1kgDups.output,
        truth_set = rules.GetIcgcSampleDups.output,
        tp_gt0 = rules.IntersectICGCDups.output.gt0_icgc,
        tp_gt1 = rules.IntersectICGCDups.output.gt1_icgc,
        tp_manta_tn = rules.IntersectICGCDups.output.manta_somatic_icgc,
        tp_gnomad = rules.IntersectICGCDups.output.gnomad_icgc,
        tp_1kg = rules.IntersectICGCDups.output.onekg_icgc
    output:
        temp(f'{outdir}/{{fid}}.dup-stats.tsv')
    shell:
        """
        python3 scripts/calculate_stats.py \\
            --fid {wildcards.fid} \\
            --unfiltered {input.unfiltered} \\
            --filtered_gt0 {input.filtered_gt0} \\
            --filtered_gt1 {input.filtered_gt1} \\
            --filtered_manta_tn {input.filtered_manta_tn} \\
            --filtered_gnomad {input.filtered_gnomad} \\
            --filtered_1kg {input.filtered_1kg} \\
            --truth_set {input.truth_set} \\
            --tp_gt0 {input.tp_gt0} \\
            --tp_gt1 {input.tp_gt1} \\
            --tp_manta_tn {input.tp_manta_tn} \\
            --tp_gnomad {input.tp_gnomad} \\
            --tp_1kg {input.tp_1kg} > {output}
        """
rule GetInvStats:
    """
    compile inv statistics from all the intersections compared against
    the truth set and the orignal call sets
    * format is: fid,method,TP,FP,TN,FN (sep='\t')
    """
    input:
        unfiltered = rules.StixQuerySingleSampleInvs.output,
        filtered_gt0 = rules.ThresholdInvRegions.output.gt0_bed,
        filtered_gt1 = rules.ThresholdInvRegions.output.gt1_bed,
        filtered_manta_tn = rules.GetSomaticInversions.output,
        filtered_gnomad = rules.SubtractGnomadInvs.output,
        filtered_1kg = rules.Subtract1kgInvs.output,
        truth_set = rules.GetIcgcSampleInvs.output,
        tp_gt0 = rules.IntersectICGCInvs.output.gt0_icgc,
        tp_gt1 = rules.IntersectICGCInvs.output.gt1_icgc,
        tp_manta_tn = rules.IntersectICGCInvs.output.manta_somatic_icgc,
        tp_gnomad = rules.IntersectICGCInvs.output.gnomad_icgc,
        tp_1kg = rules.IntersectICGCInvs.output.onekg_icgc
    output:
        temp(f'{outdir}/{{fid}}.inv-stats.tsv')
    shell:
        """
        python3 scripts/calculate_stats.py \\
            --fid {wildcards.fid} \\
            --unfiltered {input.unfiltered} \\
            --filtered_gt0 {input.filtered_gt0} \\
            --filtered_gt1 {input.filtered_gt1} \\
            --filtered_manta_tn {input.filtered_manta_tn} \\
            --filtered_gnomad {input.filtered_gnomad} \\
            --filtered_1kg {input.filtered_1kg} \\
            --truth_set {input.truth_set} \\
            --tp_gt0 {input.tp_gt0} \\
            --tp_gt1 {input.tp_gt1} \\
            --tp_manta_tn {input.tp_manta_tn} \\
            --tp_gnomad {input.tp_gnomad} \\
            --tp_1kg {input.tp_1kg} > {output}
        """
    
rule GenerateReport:
    """
    combine stats into a single report
    """
    input:
        expand(f'{outdir}/{{fid}}.stats.tsv', fid=tumour_file_ids)
    output:
        report = f'{outdir}/stats_report.tsv',
        header = temp(f'{outdir}/header.tsv')
    shell:
        """
        printf 'fileID\tmethod\tTP\tFP\tTN\tFN\n' > {output.header}
        cat {output.header} {input} > {output.report}
        """
rule GenerateDupReport:
    """
    combine dup stats into a single report
    """
    input:
        expand(f'{outdir}/{{fid}}.dup-stats.tsv', fid=tumour_file_ids)
    output:
        report = f'{outdir}/dup_stats_report.tsv',
        header = temp(f'{outdir}/dup_header.tsv')
    shell:
        """
        printf 'fileID\tmethod\tTP\tFP\tTN\tFN\n' > {output.header}
        cat {output.header} {input} > {output.report}
        """

rule GenerateInvReport:
    """
    combine inv stats into a single report
    """
    input:
        expand(f'{outdir}/{{fid}}.inv-stats.tsv', fid=tumour_file_ids)
    output:
        report = f'{outdir}/inv_stats_report.tsv',
        header = temp(f'{outdir}/inv_header.tsv')
    shell:
        """
        printf 'fileID\tmethod\tTP\tFP\tTN\tFN\n' > {output.header}
        cat {output.header} {input} > {output.report}
        """
