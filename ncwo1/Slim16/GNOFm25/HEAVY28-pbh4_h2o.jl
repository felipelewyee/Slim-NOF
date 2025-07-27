using DoNOF

mol = """
0 1
   Pb        -0.00560663     -1.82924487      0.00000000
   H          0.77873138     -2.46128288      1.40038500
   H         -1.64529163     -2.36473488      0.00000000
   H          0.06084138     -0.11358788      0.00000000
   H          0.77873138     -2.46128288     -1.40038500
   O         -0.00560663      2.68458013      0.00000000
   H          0.77466737      3.24102612      0.00000000
   H         -0.73646662      3.30452712      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-pbh4_h2o"

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
