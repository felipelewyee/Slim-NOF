using DoNOF

mol = """
0 1
H 0.000000 1.164150 0.000000
H 1.008183 -0.582075 0.000000
H -1.008183 -0.582075 0.000000
F -0.527520 -1.395778 0.000000
F -0.945019 1.154735 0.000000
F 1.472540 0.241043 0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-hf_3"

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
