using DoNOF

mol = """
-1 1
   N          0.00000000      0.00000000      0.44206861
   H          0.79395339      0.00000000     -0.22103430
   H         -0.79395339      0.00000000     -0.22103430
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21EA-EA_12"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
