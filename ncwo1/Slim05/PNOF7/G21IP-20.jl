using DoNOF

mol = """
0 1
   P          0.00000000      0.00000000      0.57921360
   H         -0.59708965      1.03418961     -0.19307120
   H         -0.59708965     -1.03418961     -0.19307120
   H          1.19417930      0.00000000     -0.19307120
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21IP-20"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
