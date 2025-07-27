using DoNOF

mol = """
0 1
   Te         0.21760200     -3.04379583      0.00000000
   H          0.26638700     -1.41033683      0.00000000
   H         -1.41498400     -2.99244583      0.00000000
   Te         0.21760200      1.71952117      0.00000000
   H          1.50566900      2.72384017      0.00000000
   H         -0.79227600      3.00321717      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-teh2_2"

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
