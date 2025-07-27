using DoNOF

mol = """
0 1
S       -0.726771   -1.075032    0.000000 
S        0.000000    0.671244    0.000000 
O        1.453541    0.807576    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-s2o"

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
