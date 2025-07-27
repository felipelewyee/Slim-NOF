using DoNOF

mol = """
0 1
N          0.359011992707    0.182100579047   -0.826971520423
H          1.187607731412   -0.402752954475   -0.877313602017
H         -0.302815572360   -0.207558990448   -1.485208477152
C         -0.201005447520    0.102582784531    0.520406601472
H         -1.095084398408    0.720428922492    0.581627497827
H         -0.465092139202   -0.904659460390    0.857912192878
H          0.517377833318    0.509859119244    1.229547307467
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-10A"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
