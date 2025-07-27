using DoNOF

mol = """
1 1
   C         -1.17819803      0.00000000      0.16558425
   C          0.00000000      0.00000000     -0.54301969
   H          0.00000000      0.00000000     -1.62736557
   C          1.17819803      0.00000000      0.16558425
   H          1.17714072      0.00000000      1.25257680
   H          2.14433964      0.00000000     -0.33296842
   H         -1.17714072      0.00000000      1.25257680
   H         -2.14433964      0.00000000     -0.33296842
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-4p"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
