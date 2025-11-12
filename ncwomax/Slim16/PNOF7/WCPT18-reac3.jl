using DoNOF

mol = """
0 1
C	0.000000	0.441567	0.000000
H	-0.160761	1.511265	0.000000
O	-1.190786	-0.218672	0.000000
C	1.211912	-0.100389	0.000000
H	1.366272	-1.172267	0.000000
H	2.084631	0.533570	0.000000
H	-1.035326	-1.170266	0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
