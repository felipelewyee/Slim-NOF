using DoNOF

mol = """
0 1
C          0.554448944926    0.153696287805    0.038658938423
O          1.257997032703    1.127014328781    0.278411603778
O          1.026854633113   -1.048526526184   -0.249612251504
H          2.020593807732   -1.015721663303   -0.234989226187
C         -0.942269649306    0.199105538900    0.042856255409
H         -1.279839828912    1.204019717783    0.264915275671
H         -1.316731129213   -0.121053832861   -0.926396615199
H         -1.321053810936   -0.498533850920    0.786156019557
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-20A"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
