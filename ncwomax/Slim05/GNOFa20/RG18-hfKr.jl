using DoNOF

mol = """
0 1
H     0.0000000    0.0000000   -0.5943542 
F     0.0000000    0.0000000   -1.5100954 
Kr    0.0000000    0.0000000    2.1044496 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-hfKr"

p.ipnof = 8
p.ista = 4

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
