using DoNOF

mol = """
0 1
  N     -1.10641339     -0.09909070      1.63870926
  H     -0.62338272     -0.98780499      1.57364191
  H     -0.63052708      0.41097726      2.37416572
  H     -0.86782421      0.40216018      0.77586181
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-11B"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
