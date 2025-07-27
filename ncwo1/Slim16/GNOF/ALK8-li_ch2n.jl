using DoNOF

mol = """
0 1
C    -0.0873021   -0.5756259    0.4272794 
H     0.7239084   -0.9798726    1.0202452 
C     0.0023041    0.7585438    0.0826803 
H    -1.0679668   -0.9409131    0.7065507 
Li    0.2893331    0.0164861   -1.6539172 
N     0.1397233    1.7213818   -0.5828383 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ALK8-li_ch2n"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
