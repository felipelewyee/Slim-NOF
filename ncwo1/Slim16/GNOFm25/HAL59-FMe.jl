using DoNOF

mol = """
0 1
   F     0.000000    0.000000    0.750748
   C     0.000000    0.000000   -0.633555
   H     0.000000    1.031390   -0.985135
   H    -0.893210   -0.515695   -0.985135
   H     0.893210   -0.515695   -0.985135
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-FMe"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
