cat pcawg/pcawg.svs.t2tINV.bedpe \
| gargs -p 64 'echo -en "{}\t";bash qbedpe.sh {0} {1} {2} {3} {4} {5} INV' \
> pcawg/pcawg.svs.t2tINV.bedpe.stix_1kg

cat pcawg/pcawg.svs.h2hINV.bedpe \
| gargs -p 64 'echo -en "{}\t";bash qbedpe.sh {0} {1} {2} {3} {4} {5} INV' \
> pcawg/pcawg.svs.h2hINV.bedpe.stix_1kg

cat pcawg/pcawg.svs.DEL.bedpe \
| gargs -p 64 'echo -en "{}\t";bash qbedpe.sh {0} {1} {2} {3} {4} {5} DEL' \
> pcawg/pcawg.svs.DEL.bedpe.stix_1kg

cat pcawg/pcawg.svs.DUP.bedpe \
| gargs -p 64 'echo -en "{}\t";bash qbedpe.sh {0} {1} {2} {3} {4} {5} DUP' \
> pcawg/pcawg.svs.DUP.bedpe.stix_1kg
