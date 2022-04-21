#! usr/bin/python3

from ete3 import Tree

t = Tree("Alignment2.fas.treefile")

print(t)

t.write(format=1, outfile="Alignment2.fas_tree.mw")
