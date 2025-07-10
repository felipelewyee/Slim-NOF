using DoNOF

mol = """
0 1
   Te         0.15484300     -1.24517940      0.00000000
   H         -1.40044400     -0.75199040      0.00000000
   H         -0.32770400     -2.80730240      0.00000000
   H          1.41846200      2.32823760      0.00000000
   Cl         0.15484300      2.47623460      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-teh2_hcl"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
