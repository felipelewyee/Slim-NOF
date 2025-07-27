using DoNOF

mol = """
0 1
   Bi         0.00000000      0.00000000      1.05658983
   H         -0.71970639      1.24656804      2.07032793
   H         -0.71970639     -1.24656804      2.07032793
   H          1.43941278      0.00000000      2.07032793
   I          0.00000000      0.00000000     -2.83691217
   H          0.00000000      0.00000000     -4.43066117
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_hi"

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
