using DoNOF

mol = """
0 1
   C          0.70338207      0.41072619     -0.43358139
   O          1.38149083      0.42641087     -1.45571311
   C         -0.26121262     -0.72702314     -0.09377997
   H         -1.04013345     -0.37584786      0.60160992
   H          0.32785958     -1.48083385      0.45638787
   N          0.78095173      1.40866259      0.50263688
   H          0.23673184      1.39536412      1.35566886
   H          1.45273932      2.15458782      0.35799207
   C         -0.88042004     -1.35872278     -1.34035635
   H         -1.46910601     -2.24747287     -1.07535319
   H         -1.54325977     -0.65017538     -1.85613339
   H         -0.09397911     -1.65231338     -2.04644039
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C2H5CONH2"

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
