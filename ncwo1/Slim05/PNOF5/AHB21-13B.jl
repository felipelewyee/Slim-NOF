using DoNOF

mol = """
0 1
  F     -2.79019342      0.08212057      0.39201215
  H     -3.63394766      0.58534228      0.39040005
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-13B"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
