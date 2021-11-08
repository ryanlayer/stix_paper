## Germline filtering pipeline
### Snakemake installation
The germline filtering analysis uses a more current version of snakemake. 
First install the latest version of the conda package manager.  To install snakemake we use mamba.

```bash
conda install -n base -c conda-forge mamba
conda activate base
mamba create -c conda-forge -c bioconda -n snakemake snakemake
```

To use snakemake, activate its conda environment

```bash
conda activate snakemake
```

This snakemake pipeline also requires the Amazon `awc cli` to download some required data.

### Pipeline configuration
Before running the pipeline, we must fill out `conf/config.yaml`

* `outdir`: This is the working directory for the pipeline.  All output will be generated here.  Stix index and database must be placed in this directory.
* `reference`: Path to hs37d5 reference genome from 1000 genomes project (.fa.gz)
* `donor_table`: path to `donor_table.tsv` from this directory.
* `sample_names`: path to `sample_names.txt` from this directory.
* `icgc_bed_pe_dir`: path to the directory containing the icgc bedpe svs.  This directory is created as a byproduct of running `src/get_pcawg_svs.sh` the directory will be located at `pcawg/icgc/open/`
* `gnomad_del_bed`: path to the bed file of gnomad DEL svs. This is created in the main analysis Snakefile, but a copy has been provided in this directory as `gnomad.DEL.bed`
* `gnomad_dup_bed`: path to the bed file of gnomad DUP svs. This is created in the main analysis Snakefile, but a copy has been provided in this directory as `gnomad.DUP.bed`
* `gnomad_inv_bed`: path to the bed file of gnomad INV svs. This is created in the main analysis Snakefile, but a copy has been provided in this directory as `gnomad.INV.bed`
* `onekg_bedpe`: path to 1KG bedpe of deletion SVs. This is created in the main analyisis Snakefile, but a copy has been provided in this directory as `1kg.DEL.bedpe`.
* `onekg_dup_bed`: path to 1KG bed of dup SVs. This is created in the main analyisis Snakefile, but a copy has been provided in this directory as `1kg.DUP.bed`.
* `onekg_inv_bed`: path to 1KG bed of inv SVs. This is created in the main analyisis Snakefile, but a copy has been provided in this directory as `1kg.INV.bedpe`.

### Notes on Running
This pipeline is meant to be run with VCFs of manta SV calls from PCAWG samples.  Currently, these VCFs are stored in our lab's Amazon S3 storage, and are subject to access restrictions.

Rules for downloading the SV call VCFs will fail without our lab's AWS access and secret keys (See rules `GetSingleSampleVCFs`, `GetSomaticVCFs`.  Furthermore, a line of code prior to rule exectution uses the file listing from our S3 bucket and will fail without access keys.  Code snippet in question:
```python
file_listing = subprocess.check_output(
    ['aws s3 ls s3://layerlabcu/icgc/manta-tumour-normal/'], shell=True,)
    
tumour_file_ids = list(set(
line.split()[3].split('.')[0]                                                                                                                      
for line in file_listing.decode().rstrip().split('\n')))
```
