using DoNOF

mol = """
0 1
   C         -0.34912741      0.20745894      0.00000000
   S         -1.16442807     -1.18417433      0.00000000
   O          0.97848939      0.34242450      0.00000000
   H         -0.81866004      1.18537243      0.00000000
   H          1.35372612     -0.55108154      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-9b"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
