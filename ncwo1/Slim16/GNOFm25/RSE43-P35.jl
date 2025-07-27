using DoNOF

mol = """
0 2
   C         -1.12666550      0.78080739      0.00000000
   S         -0.70989345     -0.88709219      0.00000000
   C          1.09172067     -0.81310159      0.00000000
   O          1.74579739      0.19246800      0.00000000
   H         -0.34191600      1.52254146      0.00000000
   H         -2.17455304      1.03392462      0.00000000
   H          1.51550994     -1.82954769      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P35"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
