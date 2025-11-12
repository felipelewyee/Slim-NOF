using DoNOF

mol = """
0 1
 C 1.286818 -0.367432 0.296265
 H 0.785676 -1.273998 -0.04004
 O 2.66458 -0.365658 -0.083259
 C 0.56261 0.877273 -0.208473
 H 1.163647 1.740634 0.083211
 H 0.540735 0.865628 -1.303538
 C -0.862986 1.053457 0.325711
 H -1.184477 2.08006 0.134776
 H -0.876361 0.914941 1.409674
 H 2.696493 -0.477467 -1.036796
 H 1.285622 -0.374736 1.386038
 C -1.9047 0.136894 -0.291986
 H -2.900328 0.44467 0.041066
 H -1.871148 0.224633 -1.383599
 O -1.640384 -1.206613 0.113544
 H -2.323878 -1.767339 -0.262179
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B53"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
