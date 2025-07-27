using DoNOF

mol = """
0 1
C        0.000000    0.155074    0.000000 
C        1.060329   -0.907990    0.000000 
O        0.187520    1.344716    0.000000 
O       -1.241577   -0.384989    0.000000 
H       -1.854467    0.361264    0.000000 
H        2.040021   -0.441543    0.000000 
H        0.942465   -1.540021    0.879585 
H        0.942465   -1.540021   -0.879585 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-acetic"

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
