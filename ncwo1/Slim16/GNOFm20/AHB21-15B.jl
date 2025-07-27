using DoNOF

mol = """
0 1
  N     -1.14955058     -0.03994433      1.59773591
  H     -0.79938973     -0.99197454      1.58883828
  H     -0.71314780      0.39769793      2.40214495
  H     -0.70067253      0.40809859      0.78463418
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-15B"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
