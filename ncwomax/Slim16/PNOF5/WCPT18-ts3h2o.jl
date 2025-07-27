using DoNOF

mol = """
0 1
C	-1.052939	-0.251581	-0.157748
H	-1.923167	-0.521696	-0.766377
O	-0.280052	-1.209002	0.171390
C	-0.755357	1.097543	0.084037
H	-0.380893	1.351330	1.073089
H	0.665145	0.893073	-0.235114
H	-1.418229	1.837130	-0.343451
H	0.875277	-0.641244	0.197011
O	1.642542	0.208515	-0.005237
H	2.131724	0.009531	-0.812120
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts3h2o"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
