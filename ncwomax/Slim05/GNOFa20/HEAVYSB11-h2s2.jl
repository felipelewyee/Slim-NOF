using DoNOF

mol = """
0 1
   S         -1.02300517     -0.01199737     -0.46829089
   S          1.02300517      0.01199737     -0.46829089
   H         -1.23548206      0.93135068      0.46829089
   H          1.23548206     -0.93135068      0.46829089
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVYSB11-h2s2"

p.ipnof = 8
p.ista = 4

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
