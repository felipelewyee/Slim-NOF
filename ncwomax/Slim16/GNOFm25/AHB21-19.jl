using DoNOF

mol = """
-1 1
  O      1.38050831     -0.61427585      0.64553692
  O      0.75999638      1.34165130     -0.38416264
  C      0.56237196      0.17240266      0.09422137
  H     -0.50009988     -0.19426003      0.00145233
  H      2.30499465      2.01523558     -0.28866606
  O      3.23686387      2.37650656     -0.26222526
  C      4.08715257      1.23732458     -0.32691746
  H      5.05209288      1.49309783      0.14605501
  H      3.63898796      0.37456525      0.19473751
  H      4.29416473      0.93841922     -1.37563229
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-19"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
