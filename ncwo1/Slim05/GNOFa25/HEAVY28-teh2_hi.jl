using DoNOF

mol = """
0 1
   Te         0.03866320      2.16215120      0.00000000
   H         -0.10453280      0.53339420      0.00000000
   H         -1.58803480      2.30795520      0.00000000
   H          1.61524120     -2.39760280      0.00000000
   I          0.03866320     -2.60589780      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-teh2_hi"

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
