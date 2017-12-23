#!/usr/bin/env python
from Bio import SeqIO
import sys

#please make sure that no space in the seq.id
#usage: ./get_longest_transcript.py origin.fa > out.fa

lastGene = None
longest = (None, None)
for rec in SeqIO.parse(sys.argv[1], "fasta"):
    gene = rec.id.split("gene=")[-1]
    l = len(rec)
    if lastGene is not None:
        if gene == lastGene:
            if longest[0] < l:
                longest = (l, rec)
        else:
            lastGene = gene
            SeqIO.write(longest[1], sys.stdout, "fasta")
            longest = (l, rec)
    else:
        lastGene = gene
        longest = (l, rec)
SeqIO.write(longest[1], sys.stdout, "fasta")
