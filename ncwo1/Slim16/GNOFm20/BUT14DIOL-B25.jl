using DoNOF

mol = """
0 1
 C -0.466737 1.887282 -0.023508
 H -1.102447 1.905735 0.861314
 O 0.283724 3.09666 0.023599
 C 0.411539 0.643534 -0.006295
 H 1.061697 0.65232 -0.887093
 H 1.061833 0.68878 0.869926
 C -0.411539 -0.643534 0.006295
 H -1.061833 -0.68878 -0.869926
 H -1.061697 -0.65232 0.887093
 H 0.820377 3.132962 -0.772687
 H -1.123307 1.868388 -0.899859
 C 0.466737 -1.887282 0.023508
 H 1.102447 -1.905735 -0.861314
 H 1.123307 -1.868388 0.899859
 O -0.283724 -3.09666 -0.023599
 H -0.820377 -3.132962 0.772687
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B25"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
