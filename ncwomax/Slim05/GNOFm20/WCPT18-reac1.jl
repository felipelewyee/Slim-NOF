using DoNOF

mol = """
0 1
C	0.000000	0.421035	0.000000
H	-0.383063	1.448042	0.000000
H	-0.659556	-1.343644	0.000000
O	1.158518	0.117088	0.000000
O	-1.028191	-0.445914	0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac1"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
