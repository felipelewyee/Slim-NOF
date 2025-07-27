using DoNOF

mol = """
0 1
   I     0.000000    0.000000    1.441995
   C     0.000000    1.150645   -1.362018
   N     0.000000    0.000000   -0.570333
   O     0.000000    2.281951   -0.968868
   O     0.000000   -2.281951   -0.968868
   C     0.000000   -1.150645   -1.362018
   C     0.000000   -0.661775   -2.780319
   C     0.000000    0.661775   -2.780319
   H     0.000000    1.349337   -3.611742
   H     0.000000   -1.349337   -3.611742
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NIS"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
