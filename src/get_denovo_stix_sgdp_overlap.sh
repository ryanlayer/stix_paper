cat denovo/dnsv.GRCh37.DEL.bed \
| gargs -p 64 'echo -en "{}\t";bash qdel.sh {0} {1} {2}' \
> denovo/dnsv.GRCh37.DEL.bed.stix_sgdp

cat denovo/dnsv.GRCh37.DUP.bed \
| gargs -p 64 'echo -en "{}\t";bash qdup.sh {0} {1} {2}' \
> denovo/dnsv.GRCh37.DUP.bed.stix_sgdp

cat denovo/dnsv.GRCh37.INV.bed \
| gargs -p 64 'echo -en "{}\t";bash qdup.sh {0} {1} {2}' \
> denovo/dnsv.GRCh37.INV.bed.stix_sgdp
