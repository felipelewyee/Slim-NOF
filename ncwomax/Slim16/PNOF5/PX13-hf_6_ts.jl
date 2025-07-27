using DoNOF

mol = """
0 1
H 0.965638 1.672535 0.000000
H -0.965638 1.672535 0.000000
H -1.931277 0.000000 0.000000
H -0.965638 -1.672535 0.000000
H 1.931277 0.000000 0.000000
H 0.965638 -1.672535 0.000000
F -1.923203 1.110362 0.260919
F 0.000000 2.220724 -0.260919
F -1.923203 -1.110362 -0.260919
F 1.923203 1.110362 0.260919
F 0.000000 -2.220724 0.260919
F 1.923203 -1.110362 -0.260919
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-hf_6_ts"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
