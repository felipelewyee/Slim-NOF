using DoNOF

mol = """
0 1
C        0.000000    0.421944    0.000000 
H       -0.374304    1.449673    0.000000 
O        1.157954    0.108822    0.000000 
O       -1.030349   -0.440495    0.000000 
H       -0.646531   -1.327950    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-formic"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
