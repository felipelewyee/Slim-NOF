using DoNOF

mol = """
0 1
   N     0.000000    0.000000   -2.038393
   C     0.000000    0.000000   -3.178266
   H     0.000000    0.000000   -4.246203
   Br    0.000000    0.000000    0.490152
   F     0.000000    0.000000    2.269913
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_FBr"

p.ipnof = 8
p.ista = 4

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
