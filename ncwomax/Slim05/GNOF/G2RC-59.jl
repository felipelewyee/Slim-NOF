using DoNOF

mol = """
0 1
   Al         0.00000000      0.00000000      0.00000000
   F          0.82189016      1.42355552      0.00000000
   F          0.82189016     -1.42355552      0.00000000
   F         -1.64378032      0.00000000      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-59"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
