#!/bin/bash


concatenate () {
  cat *fasta>>all_sequence.fasta
}

concatenate

align () {
#This script help to make a alignment of DNA sequences from all_sequence.fasta file(That we made previously combing all the DNA sequence)
#So here we use L-INS-i method as alignment method (--localpair).Normally believe L-INS-i is the most accurate method. And clustal format as the output format (--clustalout)

mafft --localpair --maxiterate 1000 --clustalout all_sequence.fasta>Alignment.aln
}
align


# Here, we use Mega 11 to remove unwanted sequences and export file as .fas file

# I M P O R T A N T:The .fas file should be copied to the directory you are working in after Mega11 export

iqtree_func() {

#This script help to make newick format tree

iqtree -s Alignment2.fas
}

iqtree_func


"""
To import the python script of visualizing tree using ete3 toolkit
"""

# Python should be installed 
# You have to have the file import_tree.py in the folder 
visualize_tree() {
python3 import_tree.py
}

visualize_tree
