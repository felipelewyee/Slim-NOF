using DoNOF

mol = """
0 1
  O      1.05946357      1.41661246      0.17358440
  H      2.01489558      1.43516905      0.23109813
  H      0.81042444      2.33892497      0.23556280
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CHB6-24B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
