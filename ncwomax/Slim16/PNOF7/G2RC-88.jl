using DoNOF

mol = """
0 1
   C          0.00000000     -0.66758522      0.92642372
   C          0.00000000     -0.78551067     -0.58522126
   C          0.00000000      0.78551067     -0.58522126
   C          0.00000000      0.66758522      0.92642372
   H          0.00000000     -1.41045923      1.71319208
   H          0.88703954     -1.24267441     -1.02719727
   H         -0.88703954     -1.24267441     -1.02719727
   H         -0.88703954      1.24267441     -1.02719727
   H          0.88703954      1.24267441     -1.02719727
   H          0.00000000      1.41045923      1.71319208
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-88"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
