using DoNOF

mol = """
0 1
  S      0.23822045     -0.32759885      0.22386308
  H      1.45500849      0.22343806      0.25687266
  H     -0.39093681      0.89386854      0.17792180
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-14B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
