using DoNOF

mol = """
0 1
   Te        -0.27801386     -1.82151771      0.00000000
   H          0.21816614     -3.38866571      0.00000000
   H          1.27654414     -1.33346771      0.00000000
   N         -0.27801386      1.35373929      0.00000000
   H          0.15335914      1.77217829      0.81226000
   H          0.15335914      1.77217829     -0.81226000
   H         -1.24540086      1.64555529      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-teh2_nh3"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
