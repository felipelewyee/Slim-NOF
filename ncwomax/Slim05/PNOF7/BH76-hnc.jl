using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000     -1.11118191
   N          0.00000000      0.00000000      0.05815587
   H          0.00000000      0.00000000      1.05302603
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-hnc"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = nothing#DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
