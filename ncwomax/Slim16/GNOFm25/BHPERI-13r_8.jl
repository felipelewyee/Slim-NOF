using DoNOF

mol = """
0 1
   C          0.98114987      0.32463209      0.00000000
   H          1.05479862      1.40022541      0.00000000
   H          1.83571547     -0.33059054      0.00000000
   N         -0.21820442     -0.21868184      0.00000000
   H         -0.20108780     -1.24225731      0.00000000
   N         -1.37040692      0.39791534      0.00000000
   H         -2.08196481     -0.33124316      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13r_8"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.025 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
