using DoNOF

mol = """
0 1
   C          0.84569904      0.12713761      0.13946157
   O          2.05989851      0.13279236      0.15296094
   C         -0.03711667     -1.08753667     -0.04275033
   H         -0.64680710     -1.19719475      0.86842957
   H          0.62855514     -1.95668832     -0.10873027
   C         -0.95678165     -0.99781798     -1.27012836
   H         -1.56228772     -1.91016058     -1.35559181
   H         -1.63656465     -0.13999836     -1.19437542
   H         -0.37318621     -0.89300682     -2.19519053
   O          0.10954038      1.27039295      0.29899113
   H          0.76324433      1.99277608      0.40588619
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C2H5CO2H"

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
