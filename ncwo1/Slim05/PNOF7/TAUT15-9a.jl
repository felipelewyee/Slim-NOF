using DoNOF

mol = """
0 1
   C         -0.54918430      0.14626580      0.00000000
   O         -1.03357254     -0.95645391      0.00000000
   S          1.17920353      0.51275605      0.00000000
   H         -1.14791035      1.06774983      0.00000000
   H          1.55146366     -0.77031777      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-9a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
