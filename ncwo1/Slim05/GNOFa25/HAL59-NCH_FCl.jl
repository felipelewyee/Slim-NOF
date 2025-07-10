using DoNOF

mol = """
0 1
   N     0.000000    0.000000   -1.841130
   C     0.000000    0.000000   -2.982143
   H     0.000000    0.000000   -4.049770
   Cl    0.000000    0.000000    0.771599
   F     0.000000    0.000000    2.412594
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_FCl"

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
