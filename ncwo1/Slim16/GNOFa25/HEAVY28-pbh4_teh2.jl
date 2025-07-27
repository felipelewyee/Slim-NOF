using DoNOF

mol = """
0 1
   Pb         0.00321450     -2.15147538      0.00000000
   H         -0.05452650     -0.42913937      0.00000000
   H         -0.78839450     -2.75238238      1.40685700
   H         -0.78839450     -2.75238238     -1.40685700
   H          1.64665050     -2.66785337      0.00000000
   Te         0.00321450      2.81322163      0.00000000
   H          1.14353950      3.98413262      0.00000000
   H         -1.16530350      3.95587863      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-pbh4_teh2"

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
