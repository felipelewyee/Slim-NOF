using DoNOF

mol = """
0 1
   Se        -1.16279769     -0.01650541     -0.51675339
   Se         1.16279769      0.01650541     -0.51675339
   H         -1.34411166      1.01683049      0.51675339
   H          1.34411166     -1.01683049      0.51675339
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVYSB11-h2se2"

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
