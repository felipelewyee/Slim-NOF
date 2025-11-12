using DoNOF

mol = """
0 1
  H      2.30499465      2.01523558     -0.28866606
  O      3.23686387      2.37650656     -0.26222526
  C      4.08715257      1.23732458     -0.32691746
  H      5.05209288      1.49309783      0.14605501
  H      3.63898796      0.37456525      0.19473751
  H      4.29416473      0.93841922     -1.37563229
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-19B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
