using DoNOF

mol = """
0 1
C     0.0000000    1.1955475    0.1591536 
C     0.0000000    0.0000000   -0.8095231 
C     0.0000000   -1.1955475    0.1591536 
N     0.0000000   -0.6147607    1.5357795 
N     0.0000000    0.6147607    1.5357795 
H    -0.8790141    1.8382622    0.0805604 
H     0.8790141    1.8382622    0.0805604 
H    -0.8801214    0.0000000   -1.4512923 
H     0.8801214    0.0000000   -1.4512923 
H     0.8790141   -1.8382622    0.0805604 
H    -0.8790141   -1.8382622    0.0805604 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-13dip"

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
