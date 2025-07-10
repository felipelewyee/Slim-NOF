using DoNOF

mol = """
0 1
   Br    0.000000    0.000000    1.919978
   Br    0.000000    0.000000   -0.367147
   N     0.000000    0.000000   -3.235006
   C     0.000000    0.000000   -4.376626
   H     0.000000    0.000000   -5.444276
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-BrBr_NCH"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
