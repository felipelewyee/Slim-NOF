using DoNOF

mol = """
0 1
Si   -1.1765062   -0.5821294   -0.1324952 
C     1.0137683   -0.7003580   -0.3098433 
C     1.2267200    0.6148820    0.1018528 
H     1.7178327   -1.2464475   -0.9348581 
H     0.6784305   -1.3363752    0.5160948 
C    -0.0074293    1.2478232    0.3619010 
H     2.2059209    1.0823935    0.2074074 
H    -0.4892151    1.5790776   -0.5541432 
H    -0.0851766    2.0274100    1.1206472 
H    -2.3300220    0.1921644   -0.6534259 
H    -1.4658618   -1.0617275    1.2372811 
H    -1.2884613   -1.8167132   -0.9604186 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHDIV10-ts9"

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
