# Final_Project_BIOL7180
This repository includes all the scripts and other files That going to use for the final project of BIOL 7180. Here we use 16s mitochondrial DNA sequence data of 36 Pterygoplichthys individuals to construct this phylogenetics tree. Bash and python are the main languages we used in here. This project include 4 bash scripts (all_seq.sh, mafft.sh, iqtree.sh and combine_func.sh) and 1 python script (import_tree.py). 

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
First need to make a new folder fasta_files in the main directory and need to add all the fasta files in to this fasta_files folder.
Concatenation of .fasta files using cat function which includes the following command 

<pre>concatenate <font color="#4E9A06">()</font> <font color="#4E9A06">{</font>
  <font color="#3465A4"><b>cat</b></font> *fasta<font color="#4E9A06">&gt;&gt;</font>all_sequence.fasta
<font color="#4E9A06">}</font>
concatenate</pre>

## Alignment 

For alignment, we are going to use mafft which is an open source alignment program that can be used with bash

mafft can be installed with the following command: 
sudo apt install mafft

<pre>sudo apt install mafft </pre>

The following bash function was used to generate an alignment

<pre>align <font color="#4E9A06">()</font> <font color="#4E9A06">{</font> <font color="#06989A">
mafft<font color="#75507B"><b> --localpair --maxiterate</b></font> 1000<font color="#75507B"><b> --clustalout</b></font> all_sequence.fasta<font color="#4E9A06">&gt;</font>Alignment.aln
<font color="#4E9A06">}</font>
align</pre>

## Mega 11 Software

The sequence obtained from alignment as .aln file was analyzed using Mega 11 software (https://www.megasoftware.net/). 
The unwanted sequences were removed, the sequence was renamed and exported as .fas file. In this case, it is Alignment2.fas

## IQTree 

The .fas file was used in IQTree (http://www.iqtree.org/) using the following bash command

<pre>sudo apt-get install iqtree </pre>

Following the installation, following command will be used to generate a .treefile

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
