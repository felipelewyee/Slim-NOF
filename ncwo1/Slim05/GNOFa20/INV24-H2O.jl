using DoNOF

mol = """
0 1
  O   -0.02085472758024      0.00000000000000     -0.01495598121153
  H   0.01876805202920      0.00000000000000      0.94578209125484
  H   0.89775667555104      0.00000000000000     -0.29748911004330
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "INV24-H2O"

p.ipnof = 8
p.ista = 4

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
