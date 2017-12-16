#!/usr/bin/env python
import sys
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO

def make_protein_record(nuc_record):
    """Returns a new SeqRecord with the translated sequence (default table)."""
    return SeqRecord(seq = nuc_record.seq.translate(cds=True), \
                     id = "trans_" + nuc_record.id, \
                     description = "translation of CDS, using default table")

your_coding_sequences = sys.argv[1]
translationed_sequences = sys.argv[2]

print 'Argument List:', str(sys.argv)

proteins = (make_protein_record(nuc_rec) for nuc_rec in \
            SeqIO.parse(your_coding_sequences, "fasta"))
SeqIO.write(proteins, translationed_sequences, "fasta")
