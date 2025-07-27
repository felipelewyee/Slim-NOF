using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.76298824
   C          0.00000000      0.00000000     -0.76298824
   H         -0.88280910      0.50969007      1.15804020
   H          0.00000000     -1.01938014      1.15804020
   H          0.88280910      0.50969007      1.15804020
   H          0.88280910     -0.50969007     -1.15804020
   H         -0.88280910     -0.50969007     -1.15804020
   H          0.00000000      1.01938014     -1.15804020
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ADIM6-AM2"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
