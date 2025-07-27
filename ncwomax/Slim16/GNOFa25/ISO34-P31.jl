using DoNOF

mol = """
0 1
   C         -2.10355599     -0.66462823      0.00000000
   C         -1.01429264      0.37028491      0.00000000
   O          0.21520642     -0.23826729      0.00000000
   C          1.34806103      0.55833421      0.00000000
   C          2.54953731      0.00433570      0.00000000
   O         -1.16549928      1.56203665      0.00000000
   H         -3.07177946     -0.17081537      0.00000000
   H         -2.01001519     -1.30397545      0.87977696
   H         -2.01001519     -1.30397545     -0.87977696
   H          1.15096997      1.62152175      0.00000000
   H          2.68397859     -1.06939882      0.00000000
   H          3.42740443      0.63454738      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-P31"

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
