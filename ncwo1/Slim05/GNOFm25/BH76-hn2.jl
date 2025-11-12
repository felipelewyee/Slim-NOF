using DoNOF

mol = """
0 2
   N         -0.31221246      0.94105672      0.00000000
   N         -0.31221246     -0.23714479      0.00000000
   H          0.62442492     -0.70391193      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-hn2"

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
