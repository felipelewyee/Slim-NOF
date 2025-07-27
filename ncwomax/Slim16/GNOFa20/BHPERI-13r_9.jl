using DoNOF

mol = """
0 1
   N          0.00000000      0.00000000     -0.36875516
   H          0.00000000      0.00000000     -1.38378716
   C          1.22577450      0.00000000      0.15784007
   H          1.33931529      0.00000000      1.22986735
   H          2.06809426      0.00000000     -0.51143626
   C         -1.22577450      0.00000000      0.15784007
   H         -1.33931529      0.00000000      1.22986735
   H         -2.06809426      0.00000000     -0.51143626
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13r_9"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
