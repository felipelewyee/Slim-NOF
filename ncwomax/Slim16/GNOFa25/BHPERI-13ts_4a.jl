using DoNOF

mol = """
0 1
   C          0.93577667      0.39537143      0.00000000
   C          0.85196601     -0.96841085      0.00000000
   O         -1.50506259     -1.24340628      0.00000000
   N         -1.72883338     -0.04590722      0.00000000
   C         -1.16713640      1.02284528      0.00000000
   H          1.15273844      0.92694986      0.92000024
   H          1.15273844      0.92694986     -0.92000024
   H          0.87762775     -1.53660420      0.92009471
   H          0.87762775     -1.53660420     -0.92009471
   H         -1.44744268      2.05881632      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_4a"

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
