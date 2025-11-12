using DoNOF

mol = """
0 1
   N     0.000000    0.000000    3.716503
   C     0.000000    0.000000    4.857258
   H     0.000000    0.000000    5.925157
   N     0.000000    0.000000   -1.177232
   O     0.000000    2.280463   -1.583208
   O     0.000000   -2.280463   -1.583208
   C     0.000000   -1.144745   -1.970477
   C     0.000000   -0.661512   -3.392201
   C     0.000000    0.661512   -3.392201
   H     0.000000    1.350667   -4.222380
   H     0.000000   -1.350667   -4.222380
   C     0.000000    1.144745   -1.970477
   I     0.000000    0.000000    0.854427
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_NIS"

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
