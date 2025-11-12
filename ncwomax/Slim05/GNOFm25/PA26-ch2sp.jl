using DoNOF

mol = """
1 1
S     0.3082691   -1.1248975    0.0000000 
C     0.2332779    0.4820209    0.0000000 
H    -0.7041702    1.0234675    0.0000000 
H     1.1670468    1.0314181    0.0000000 
H    -1.0044235   -1.4120089    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-ch2sp"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
