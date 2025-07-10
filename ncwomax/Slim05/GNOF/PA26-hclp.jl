using DoNOF

mol = """
1 1
Cl    0.0000000    0.0000000   -0.5924005 
H    -0.9709660    0.0000000    0.2962002 
H     0.9709660    0.0000000    0.2962002 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-hclp"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
