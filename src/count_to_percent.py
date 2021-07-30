import sys
import numpy as np

F = []
for l in sys.stdin:
    A = [int(x) for x in l.rstrip().split()]
    if sum(A) == 0:
        continue
    m = float(max(A))
    f = [x/m for x in A]
    F.append(f)

C = [[] for i in range(len(F[0]))]

for f in F:
    for i in range(len(f)):
        C[i].append(f[i])

Y = []
for c in C:
    Y.append(np.median(c))

X = [-500,-450,-400,-350,-300,-250,-200,-150,-100,-50,0,50,100,150,200,250,300,350,400,450,500]
for xy in zip(X,Y):
    print(' '.join([str(x) for x in xy]))
