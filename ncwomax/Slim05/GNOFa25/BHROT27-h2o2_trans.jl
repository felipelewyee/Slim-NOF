using DoNOF

mol = """
0 1
O    -0.0044695   -0.7207736    0.0000000 
O     0.0044695    0.7207736    0.0000000 
H    -0.9535873   -0.8702773    0.0000000 
H     0.9535873    0.8702773    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-h2o2_trans"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
