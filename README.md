# Final_Project_BIOL7180
This repository includes all the scripts and other files That going to use for the final project of BIOL 7180

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
1. Concatenation of .fasta files

