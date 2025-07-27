using DoNOF

mol = """
0 1
   N         -0.72219557      0.27784384      0.00000000
   N          0.02564879      1.38725382      0.00000000
   N          1.26640178      0.97739169      0.00000000
   N          1.33004439     -0.37657021      0.00000000
   C          0.08136949     -0.79585655      0.00000000
   H         -1.72582264      0.34508004      0.00000000
   H         -0.25544623     -1.81514262      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-7b"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
