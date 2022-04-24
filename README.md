# Final Project BIOL7180 (Identification of Sailfin catfishes in Sri Lanka based on Mitochondrial DNA data)

This repository includes all the scripts and other files That going to use for the final project of BIOL 7180. Here we use 16s mitochondrial DNA sequence data of 36 Pterygoplichthys individuals to construct this phylogenetics tree. Bash and python are the main languages we used in here. This project include 4 bash scripts (all_seq.sh, mafft.sh, iqtree.sh and combine_func.sh) and 1 python script (import_tree.py). To make DNA sequence alignment we used MAFFT (multiple alignment using fast Fourier transform) program. To get maximusum likelihood phylogenetic tree we used terminal based iqtree program. And to visualize phylogenetic tree we used ete3 (The Environment for Tree Exploration) python toolkit.  

## Objective 
The objective of this project is to generate a phylogenetic tree from .fasta sequence files using bash and python scripts

## The Workflow
  - .fasta files of sequences are needed to begin with the project. 
  - These fasta files will be concatenated using a shell command
  - The concateanted fasta files will be aligned using mafft
  - The aligned sequences in .aln format will be manually checked using Mega software
  - The .fas file generated by Mega will be fed to the iqtree command 
  - The resulting .Alignment.fas.treefile will need to be visualized in python
  - The visualization and generation of final tree will be done using python ete3 toolkit
  - A PNG should be visible in the folder after the command has been run


## Preparation
First need to make a new folder fasta_files in the main directory and need to add all the fasta files into this fasta_files folder.

Concatenation of .fasta files using cat function which includes the following command. You can use all_sequence.sh script for this step. 

<pre>concatenate <font color="#4E9A06">()</font> <font color="#4E9A06">{</font>
  <font color="#3465A4"><b>cat</b></font> *fasta<font color="#4E9A06">&gt;&gt;</font>all_sequence.fasta
<font color="#4E9A06">}</font>
concatenate</pre>

## Alignment 

For alignment, we are going to use mafft which is an open source alignment program that can be used with bash

mafft can be installed with the following command: 
sudo apt install mafft

<pre>sudo apt install mafft </pre>

The following bash function was used to generate an alignment (Alignment.sh).

<pre>align <font color="#4E9A06">()</font> <font color="#4E9A06">{</font> <font color="#06989A">
mafft<font color="#75507B"><b> --localpair --maxiterate</b></font> 1000<font color="#75507B"><b> --clustalout</b></font> all_sequence.fasta<font color="#4E9A06">&gt;</font>Alignment.aln
<font color="#4E9A06">}</font>
align</pre>

If you want to change the Alignment model you can use thse commands (Just copy and replace these commands to Alignment.sh). In our scripts we used L-INS-i mehod (Most acurate method).

*L-INS-i (probably most accurate; recommended for <200 sequences; iterative refinement method incorporating local pairwise alignment information):
<pre>mafft --localpair --maxiterate 1000 --clustalout all_sequence.fasta>Alignment.aln</pre>

*G-INS-i (suitable for sequences of similar lengths; recommended for <200 sequences; iterative refinement method incorporating global pairwise alignment information):<pre>mafft --globalpair --maxiterate 1000 --clustalout all_sequence.fasta>Alignment.aln</pre>

*E-INS-i (suitable for sequences containing large unalignable regions; recommended for <200 sequences):
<pre>mafft --ep 0 --genafpair --maxiterate 1000 --clustalout all_sequence.fasta>Alignment.aln</pre>


## Mega 11 Software

The sequence obtained from alignment as .aln file was analyzed using Mega 11 software (https://www.megasoftware.net/). 
The unwanted sequences were removed, the sequence was renamed and exported as .fas file. In this case, it is Alignment2.fas

## IQTree 

The .fas alignment file (Alignment2.fas) was used in IQTree (http://www.iqtree.org/) using the following bash command

<pre>sudo apt-get install iqtree </pre>

Following the installation, following command will be used to generate a .treefile. This .treefile has a newick format phylogenetic tree. And this can use to visualize the phylogenetic tree using ete3 toolkit.

<pre><font color="#06989A"><font color="#4E9A06"><b>iqtree_func</b></font><font color="#4E9A06">()</font> <font color="#4E9A06">{</font><font color="#06989A">
iqtree<font color="#75507B"><b> -s</b></font> Alignment2.fas
<font color="#4E9A06">}</font>
iqtree_func</pre>

## Python ete3 Toolkit

ete3 package (http://etetoolkit.org/download/) should be isntalled with the following command 

<pre>pip install ete3</pre>

Python script import_tree will be called with a function:

<pre>python3 import_tree.py</pre>

This function involves importing Tree, TreeNode and TreeStyle. Moreover, it renders the file as png

## Output

The output of the files should be a nice tree with nodes providing distances based on maximum likelihood and individual names of raw sequences
