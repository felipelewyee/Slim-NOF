using DoNOF

mol = """
0 1
C    -1.1988023    0.6921288   -0.2686592 
C    -1.1988023   -0.6921288   -0.2686592 
C     0.0000000   -1.3842576   -0.2686592 
C     1.1988023   -0.6921288   -0.2686592 
C     1.1988023    0.6921288   -0.2686592 
C     0.0000000    1.3842576   -0.2686592 
H    -2.1331550   -1.2315776   -0.2686592 
H     0.0000000   -2.4631552   -0.2686592 
H     2.1331550   -1.2315776   -0.2686592 
H     2.1331550    1.2315776   -0.2686592 
H     0.0000000    2.4631552   -0.2686592 
H    -2.1331550    1.2315776   -0.2686592 
Ne    0.0000000    0.0000000    3.2239104 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-bzNe"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
