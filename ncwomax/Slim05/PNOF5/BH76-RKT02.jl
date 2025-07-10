using DoNOF

mol = """
0 2
   O         -0.82792559     -0.29713382      0.00000000
   H         -0.95480536      0.66248308      0.00000000
   H          0.48862454     -0.28945176      0.00000000
   H          1.29410640     -0.07589751      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT02"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
