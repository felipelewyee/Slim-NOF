using DoNOF

mol = """
0 1
   P     0.000000    0.000000   -1.774462
   C     0.000000    0.000000   -3.298017
   H     0.000000    0.000000   -4.369559
   Cl    0.000000    0.000000    1.388541
   F     0.000000    0.000000    3.018821
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_FCl"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
