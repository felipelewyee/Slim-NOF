using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.00761439
   O          0.00000000      0.00000000     -1.20231349
   H          0.94160019      0.00000000      0.59734955
   H         -0.94160019      0.00000000      0.59734955
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DIPCS10-ch2o"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
