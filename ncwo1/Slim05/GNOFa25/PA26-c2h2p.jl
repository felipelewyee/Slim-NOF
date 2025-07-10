using DoNOF

mol = """
1 1
C     0.6094085    0.0000000    0.2226866 
H     1.6886612    0.0000000    0.2335521 
C    -0.6094085    0.0000000    0.2226866 
H    -1.6886612    0.0000000    0.2335521 
H     0.0000000    0.0000000   -0.9124773 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-c2h2p"

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
