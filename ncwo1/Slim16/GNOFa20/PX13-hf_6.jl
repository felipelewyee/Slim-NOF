using DoNOF

mol = """
0 1
H -0.829028 1.947972 0.063739
H -2.101507 0.256027 -0.063739
H 0.829028 -1.947972 -0.063739
H 1.272479 1.691945 -0.063739
H -1.272479 -1.691945 0.063739
H 2.101507 -0.256027 0.063739
F 2.077176 1.199258 -0.275173
F 0.000000 2.398517 0.275173
F 0.000000 -2.398517 -0.275173
F -2.077176 1.199258 -0.275173
F -2.077176 -1.199258 0.275173
F 2.077176 -1.199258 0.275173
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-hf_6"

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
