using DoNOF

mol = """
0 1
  N     -1.10346063     -0.08276288      1.64126479
  H     -0.60746391     -0.96403360      1.55976728
  H     -0.58603413      0.44582929      2.33563939
  H     -0.90847074      0.40265240      0.75370716
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-4B"

p.ipnof = 8
p.ista = 4

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
