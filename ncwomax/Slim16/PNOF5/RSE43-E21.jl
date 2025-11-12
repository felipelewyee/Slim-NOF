using DoNOF

mol = """
0 1
   C         -0.56760093      0.09225708      0.00000000
   N          0.89401107      0.17501318      0.00000000
   H          1.28469253     -0.28172733      0.81563694
   H          1.28469253     -0.28172733     -0.81563694
   H         -0.95722232      0.61157891      0.87795276
   H         -0.98135055     -0.92697342      0.00000000
   H         -0.95722232      0.61157891     -0.87795276
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E21"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
