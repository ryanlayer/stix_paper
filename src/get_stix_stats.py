import sys

T=2504

def intersection(lst1, lst2):
    return list(set(lst1) & set(lst2)) 

def missing(E, O):
    return set(E)-set(O)

def extra(E, O):
    return set(O)-set(E)

P = 0
N = 0

TP = 0
FP = 0
TN = 0
FN = 0

for l in sys.stdin:
    A = l.rstrip().split()
    E = A[5].split(',')

    try:
        O = A[6].split(',')
    except:
        O = []

    _P = len(E)
    _N = T - _P

    _TP = len(intersection(E,O))
    _FP = len(extra(E,O))
    _FN = len(missing(E,O))
    _TN = T - (_TP + _FP + _FN)

    #if _FP >= 100:
        #continue
    #print(_TP, _FP, _FN, _TN, _P, '\t'.join(A[:3]))

    P += _P
    N += _N
    TP += _TP
    FP += _FP
    FN += _FN
    TN += _TN

print('accuracy ',float(TP + TN) / float(P + N))
print('precision ',float(TP) / float(TP + FP))
print('sensitivity ',float(TP) / float(P))
print('specificity ',float(TN) / float(N))
print('F1', float(2*TP) / float(2*TP+FP+FN))
