using DoNOF

mol = """
0 2
   N          0.00000000      0.00000000      0.42632399
   H          0.80413586      0.00000000     -0.21316199
   H         -0.80413586      0.00000000     -0.21316199
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21EA-EA_12n"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
