import argparse
import sys

def get_count(bed):
    """
    Get number of lines in the bed file. If the chromosome,
    contains any of these substrings, then don't count
    """
    ignore_contigs = {'hs', 'GL', 'X', 'Y'}
    return len(set([line for line in open(bed).readlines()
                if all([ic not in line.split()[0] for ic in ignore_contigs])]))

    
# I realized how unnessecary this was after the fact...
parser = argparse.ArgumentParser()
parser.add_argument('--fid', type=str, dest='fid', required=True)
parser.add_argument('--unfiltered', type=str, dest='unfiltered', required=True)
parser.add_argument('--filtered_gt0', type=str, dest='filtered_gt0', required=True)
parser.add_argument('--filtered_gt1', type=str, dest='filtered_gt1', required=True)
parser.add_argument('--filtered_manta_tn', type=str, dest='filtered_manta_tn', required=True)
parser.add_argument('--filtered_gnomad', type=str, dest='filtered_gnomad', required=True)
parser.add_argument('--filtered_1kg', type=str, dest='filtered_1kg', required=True)
parser.add_argument('--truth_set', type=str, dest='truth_set', required=True)
parser.add_argument('--tp_gt0', type=str, dest='tp_gt0', required=True)
parser.add_argument('--tp_gt1', type=str, dest='tp_gt1', required=True)
parser.add_argument('--tp_manta_tn', type=str, dest='tp_manta_tn', required=True)
parser.add_argument('--tp_gnomad', type=str, dest='tp_gnomad', required=True)
parser.add_argument('--tp_1kg', type=str, dest='tp_1kg', required=True)
args = parser.parse_args()
args = vars(args)


truth = get_count(args['truth_set'])
unfiltered = get_count(args['unfiltered'])

filtering_methods = {
    'filtered_gt0': 'tp_gt0',
    'filtered_gt1': 'tp_gt1',
    'filtered_manta_tn': 'tp_manta_tn',
    'filtered_gnomad': 'tp_gnomad',
    'filtered_1kg': 'tp_1kg'
}

for filtered_set, tp_set in filtering_methods.items():
    filtered = get_count(args[filtered_set])
    tp = get_count(args[tp_set])
    fp = filtered - tp
    tn = unfiltered - tp - fp
    fn = truth - tp
    print('\t'.join(map(str, [args['fid'], filtered_set, tp, fp, tn, fn])))

