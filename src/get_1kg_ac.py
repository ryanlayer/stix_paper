import sys

for l in sys.stdin:
    A = l.rstrip().split('\t')

    ac = 0
    nzc = 0
    cn0_alt_i = '1'
    if 'CN0' in A[6]:
        cn0_alt_i = str(A[6].split(',').index('<CN0>') + 1)
    for gt in A[7:-1]:
        ac += gt.count(cn0_alt_i)
        if cn0_alt_i in gt:
            nzc += 1

    print('\t'.join([A[0], A[1], A[2], str(nzc), str(ac)]))
