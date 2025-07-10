using DoNOF

mol = """
0 1
  S   0.00001473056183      0.00000027536705      0.00000000000000
  H   1.31722300858301      0.00000454820039      0.00000000000000
  H   -1.31724922264958     -0.00000400609083      0.00000000000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "INV24-H2S_TS"

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
