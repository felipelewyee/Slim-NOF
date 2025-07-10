using DoNOF

mol = """
-1 1
  F     -0.20511594      1.19194574     -0.69629013
  N     -1.07146819     -0.00912580      1.50279456
  H     -0.61757278     -0.91698377      1.47414861
  H     -0.60090013      0.48687624      2.25355584
  H     -0.76307217      0.48318498      0.60817267
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-1"

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
