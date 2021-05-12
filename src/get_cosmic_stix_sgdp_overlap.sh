gunzip -c cosmic/cosmic.DEL.bed.gz \
| gargs -p 64 'echo -en "{}\t";bash qdel.sh {0} {1} {2}' \
> cosmic/cosmic.DEL.bed.stix_sgdp

gunzip -c cosmic/cosmic.DUP.bed.gz \
| gargs -p 64 'echo -en "{}\t";bash qdup.sh {0} {1} {2}' \
> cosmic/cosmic.DUP.bed.stix_sgdp

gunzip -c cosmic/cosmic.INV.bed.gz \
| gargs -p 64 'echo -en "{}\t";bash qdup.sh {0} {1} {2}' \
> cosmic/cosmic.DUP.bed.stix_sgdp
