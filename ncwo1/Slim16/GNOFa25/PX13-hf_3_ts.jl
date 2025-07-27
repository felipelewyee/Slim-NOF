using DoNOF

mol = """
0 1
H 0.000000 0.928503 0.000000
H 0.804107 -0.464251 0.000000
H -0.804107 -0.464251 0.000000
F 0.000000 -1.304172 0.000000
F -1.129446 0.652086 0.000000
F 1.129446 0.652086 0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-hf_3_ts"

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
