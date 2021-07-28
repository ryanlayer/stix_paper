"""
Print dels from input vcf (along with header)
    * assuming single sample in vcf
    * assuming vcf has genotypes
"""
import sys
import pysam

vcf = pysam.VariantFile(sys.argv[1])
non_ref = {(0, 1), (1, 0), (1, 1)}
print(vcf.header, end='')
for variant in vcf:
    if variant.info['SVTYPE'] == 'DEL' and \
       variant.samples[0]['GT'] in non_ref:
            print(variant, end='')
    
    
