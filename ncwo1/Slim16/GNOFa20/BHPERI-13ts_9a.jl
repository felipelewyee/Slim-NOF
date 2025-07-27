using DoNOF

mol = """
0 1
   C          1.43362384     -0.07172340      0.68200097
   C          1.43362384     -0.07172340     -0.68200097
   C         -0.96582917      0.17183310     -1.19958151
   N         -1.34265896     -0.30734576      0.00000000
   C         -0.96582917      0.17183310      1.19958151
   H          1.47349709     -0.99649735      1.24415492
   H          1.65932559      0.82721106      1.24287663
   H          1.47349709     -0.99649735     -1.24415492
   H          1.65932559      0.82721106     -1.24287663
   H         -0.81622705      1.23706676     -1.28551375
   H         -1.29551941     -0.37599263     -2.07048102
   H         -1.63508282     -1.27644933      0.00000000
   H         -0.81622705      1.23706676      1.28551375
   H         -1.29551941     -0.37599263      2.07048102
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_9a"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
