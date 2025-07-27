using DoNOF

mol = """
0 1
   C         -1.00397318     -0.23174512      0.00000000
   N         -0.36247433      0.94035927      0.00000000
   N          0.88778637      0.52425614      0.00000000
   N          1.05292158     -0.79112616      0.00000000
   N         -0.17159421     -1.28817370      0.00000000
   H         -2.07447886     -0.31082202      0.00000000
   H          1.67181263      1.15725159      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-7a"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
