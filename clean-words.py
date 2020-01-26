#!/usr/bin/env python

import fileinput

total = 0
after = 0
words = {}
seq = []
for line in fileinput.input():
    line = line.strip(' \t\n')
    if len(line) != 0 and line.startswith("& "):
        total = total + 1
        w = line.split(' ')[1]
        if w not in words:
            # print w
            words[w] = True
            seq.append(w)
            after = after + 1

cgo20 = [ 'CGO', 'CStyle', 'Conformability', 'FnaFunction', 
      "Fusable", "HyPer's", "IMDBs", "InfoNode" ,"Ju" ,'Krolik',
      'Rop' ,'SQLStyle' ,'SubSec' ,'TVM' ,'basicstyle' ,'breaklines',
      'captionpos', "upquote", "vectorizer", "xleftmargin", "xrightmargin",
      'sart', 'ccs', "conformability", "keepspaces", "nnnn", "numbersep",
      "numberstyle", "printccs", "printfolios", "showspaces",
      "showstringspaces", "showtabs", "eachitem", "eachleft", "eachright",
      "firstname", "fusable", "sym", "lastname", "DBLAB", "Peloton", "IMDB",
      "isFusable", "isConformable", "FndFunction", "OptimizationFebruary",
      "isGroupB", "isGroupE", "isGroupX", "isGroupS", "isNotVisited",
      "Verbrugge", "FPGA", "HIQUE", "HorseQC", "RHS", "Rfinal", "WeldIR",
      "bool", "codegen", "geq", "itemdiscount", "itemprice",
      "len", "leq", "lt", "mul",
      "noopt", "parameterized", "relatedwork", "setVisited",
      "sql", "storeitems", "subgraph", "subgraphs", "tpch",
      "chen", "hanfeng", "kemme", "isConforming", "acmcopyright"
]

def check(inputs, words):
    print 'list not in your dictionary'
    num = 0
    for w in inputs:
        if w not in words:
            num = num + 1
            print '"%s",' % w
    print '>> total %d not in your dictionary' % num 

check(seq, cgo20)

# print 'done with total %d, after %d' % (total,after)

