#!/bin/bash


#This script help to make a alignment of DNA sequences from all_sequence.fasta file(That we made previously combing all the DNA sequence)
#So here we use L-INS-i method as alignment method (--localpair).Normally believe L-INS-i is the most accurate method. And clustal format as the output format (--clustalout) 

mafft --localpair --maxiterate 1000 --clustalout all_sequence.fasta>Alignment.aln
