using DoNOF

mol = """
-1 1
  O      1.38050831     -0.61427585      0.64553692
  O      0.75999638      1.34165130     -0.38416264
  C      0.56237196      0.17240266      0.09422137
  H     -0.50009988     -0.19426003      0.00145233
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-19A"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
