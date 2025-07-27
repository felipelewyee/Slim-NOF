using DoNOF

mol = """
0 1
C    -0.7812762    0.1517281   -0.7419824 
Cl    0.1322569   -0.0037532   -2.1651677 
C     0.0535089    0.0161273    0.4601907 
H     1.1401585    0.0053175    0.3540221 
H    -0.2671755    0.7649204    1.1894818 
H    -0.2774726   -0.9343402    0.9034555 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2O_B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
