using DoNOF

mol = """
0 1
   O          0.00000000      0.00000000      0.57855641
   F         -1.10933928      0.00000000     -0.28927821
   F          1.10933928      0.00000000     -0.28927821
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-73"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
