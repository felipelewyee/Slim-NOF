using DoNOF

mol = """
1 1
C          1.05372       -0.01340       -0.38776
N         -0.18459       -0.01338        0.25191
C          0.03326       -0.01337        1.58746
N          1.34705       -0.01338        1.80794
C          2.00905       -0.01338        0.59898
C         -1.50576       -0.01338       -0.39687
H          1.66474       -0.01338        2.77427
H         -0.70737       -0.01337        2.37755
H          3.08825       -0.01337        0.53596
H          1.13700       -0.01341       -1.46622
H         -1.36552       -0.01336       -1.48085
H         -2.06567       -0.90900       -0.10609
H         -2.06569        0.88222       -0.10607
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-148A"

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
