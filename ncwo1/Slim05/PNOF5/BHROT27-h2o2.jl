using DoNOF

mol = """
0 1
O     0.0402907   -0.7150390   -0.2337508 
O    -0.0402907    0.7150390   -0.2337508 
H    -0.7702468   -0.9380581    0.2337569 
H     0.7702468    0.9380581    0.2337569 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-h2o2"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
