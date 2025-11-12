using DoNOF

mol = """
0 1
   C         -0.75424888      1.16866628      0.00000000
   C          0.66367835      1.26318788      0.00000000
   C          1.38018084      0.10890136      0.00000000
   N          0.74286209     -1.09364789      0.00000000
   H          1.27833365     -1.94881894      0.00000000
   C         -0.64145077     -1.28327033      0.00000000
   O         -1.11161885     -2.41486607      0.00000000
   C         -1.38225633     -0.04067355      0.00000000
   H         -1.34645393      2.07351008      0.00000000
   H          1.17042160      2.21357069      0.00000000
   H          2.45872166      0.07637356      0.00000000
   H         -2.45816943     -0.12293306      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-4b"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
