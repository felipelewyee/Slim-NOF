using DoNOF

mol = """
-1 1
   Cl         0.00000000      0.00000000     -2.21807245
   C          0.00000000      0.00000000     -0.39966597
   H         -0.51253198      0.88773143     -0.05771428
   H         -0.51253198     -0.88773143     -0.05771428
   H          1.02506396      0.00000000     -0.05771428
   Cl         0.00000000      0.00000000      2.79088125
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-clch3clcomp"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
