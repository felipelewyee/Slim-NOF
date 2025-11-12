using DoNOF

mol = """
0 1
   C          0.96745826     -0.11636709      0.00000000
   N         -0.30997205     -0.08985970      0.00000000
   C         -1.52110730     -0.22012413      0.00000000
   H          1.50098112     -0.12812485      0.94177700
   H          1.50098112     -0.12812485     -0.94177700
   H         -2.13834115      0.68260062      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13r_6"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
