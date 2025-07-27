using DoNOF

mol = """
0 1
   C         -1.95848164     -0.08986344      0.00000000
   C         -0.53829223      0.39058600      0.00000000
   C          0.53829223     -0.39058600      0.00000000
   C          1.95848164      0.08986344      0.00000000
   H         -2.01216166     -1.18054752      0.00000000
   H         -2.50075408      0.27605922     -0.87805717
   H         -2.50075408      0.27605922      0.87805717
   H         -0.39879116      1.47086772      0.00000000
   H          0.39879116     -1.47086772      0.00000000
   H          2.01216166      1.18054752      0.00000000
   H          2.50075408     -0.27605922      0.87805717
   H          2.50075408     -0.27605922     -0.87805717
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E4"

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
