import sys

for l in sys.stdin:
    A = l.rstrip().split('\t')

    cipos = [0,0]
    ciend = [0,0]

    if A[5] != ".":
        cipos = [int(x) for x in A[5].split(',')]

    if A[6] != ".":
        ciend = [int(x) for x in A[6].split(',')]

    chrm = A[0]
    pos = int(A[1])
    end = int(A[2])
    alt = A[3]
    svtype = A[4]
    ac = A[7]

    strand = ['.','.']

    O = [chrm,
         pos + cipos[0],
         pos + cipos[1],
         chrm,
         end + ciend[0],
         end + ciend[1],
         ac,
         strand[0],
         strand[1],
         svtype]
    
    print('\t'.join([str(o) for o in O]))
    

#    if A[4] == '-1':
#        continue
#
#    ac = 0
#    nzc = 0
#    cn0_alt_i = '1'
#    if 'CN0' in A[6]:
#        cn0_alt_i = str(A[6].split(',').index('<CN0>') + 1)
#    for gt in A[7:-1]:
#        ac += gt.count(cn0_alt_i)
#        if cn0_alt_i in gt:
#            nzc += 1
#
#    print('\t'.join([A[0], A[1], A[2], str(nzc), str(ac)]))
