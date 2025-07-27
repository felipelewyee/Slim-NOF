using DoNOF

mol = """
0 1
P     0.2078209   -1.7674485    0.0000000 
Cl   -1.0912817   -1.9676194    1.5825606 
Cl   -1.0912817   -1.9676194   -1.5825606 
Cl    1.0912817   -3.6237210    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-5b"

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
