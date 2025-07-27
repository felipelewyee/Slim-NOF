using DoNOF

mol = """
0 2
   C          0.68268431     -0.02476657      0.00000000
   N         -0.70627948      0.08786475      0.00000000
   H          1.18727742      0.19945086      0.92958322
   H         -1.17547983     -0.23099995     -0.83522420
   H          1.18727742      0.19945086     -0.92958322
   H         -1.17547983     -0.23099995      0.83522420
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P21"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
