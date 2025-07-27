using DoNOF

mol = """
0 1
   Al         0.00000000      0.00000000     -1.59543900
   Al         0.00000000      0.00000000      1.59543900
   Cl         0.00000000      1.62307900      0.00000000
   Cl         0.00000000     -1.62307900      0.00000000
   Cl         1.82122800      0.00000000     -2.60429400
   Cl        -1.82122800      0.00000000     -2.60429400
   Cl        -1.82122800      0.00000000      2.60429400
   Cl         1.82122800      0.00000000      2.60429400
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AL2X6-al2cl6"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
