using DoNOF

mol = """
0 1
C    -2.2672042   -1.2336456   -0.0021687 
H    -2.8073993   -1.5228670    0.8952294 
C    -1.8664339    0.0963059    0.0018329 
H    -2.7953434   -1.5210411   -0.9073265 
N    -1.4164892    1.1752514    0.0060550 
Li   -0.2861359   -1.9726867    0.0063779 
C     2.2672042    1.2336456   -0.0021687 
H     2.8073993    1.5228670    0.8952294 
C     1.8664339   -0.0963059    0.0018329 
H     2.7953434    1.5210411   -0.9073265 
N     1.4164892   -1.1752514    0.0060550 
Li    0.2861359    1.9726867    0.0063779 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ALK8-li2_ch2n_2"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
