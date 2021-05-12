import sys

for l in sys.stdin:
    samples = []
    A = l.strip().split()
    for s in A[5:]:
        if '0|1' in s or '1|0' in s or '1|1' in s:
            samples.append(s.split(',')[1])

    print('\t'.join(A[0:5] + [','.join(samples)]))

