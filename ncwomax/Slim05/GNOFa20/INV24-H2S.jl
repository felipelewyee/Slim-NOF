using DoNOF

mol = """
0 1
  S   -0.20556127464025      0.00000000000000     -0.14507162979824
  H   -0.01007104299822      0.00000000000000      1.18200447183515
  H   1.11130231763847      0.00000000000000     -0.40359584203690
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "INV24-H2S"

p.ipnof = 8
p.ista = 4

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
