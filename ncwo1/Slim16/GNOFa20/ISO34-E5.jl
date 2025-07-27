using DoNOF

mol = """
0 1
   C          0.00000000     -1.27422378     -0.58431036
   C          0.00000000      0.00000000      0.21760940
   C          0.00000000      1.27422378     -0.58431036
   C          0.00000000      0.00000000      1.54963665
   H          0.00000000     -2.15656086      0.05667758
   H          0.87802317     -1.32431789     -1.23710736
   H         -0.87802317     -1.32431789     -1.23710736
   H          0.00000000      2.15656086      0.05667758
   H          0.87802317      1.32431789     -1.23710736
   H         -0.87802317      1.32431789     -1.23710736
   H          0.00000000     -0.92303407      2.11822447
   H          0.00000000      0.92303407      2.11822447
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E5"

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
