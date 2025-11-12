using DoNOF

mol = """
0 1
   Al         0.00000000      0.00000000      0.00000000
   Cl         1.04553977      1.81092800      0.00000000
   Cl         1.04553977     -1.81092800      0.00000000
   Cl        -2.09107954      0.00000000      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-60"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
