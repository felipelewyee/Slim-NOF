using DoNOF

mol = """
-1 1
Cl    -1.351043     0.035294     0.000000
 O     1.741354    -0.086572     0.000000
 H     1.829090     0.870130     0.000000
 H     0.754930    -0.179400     0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-5"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
