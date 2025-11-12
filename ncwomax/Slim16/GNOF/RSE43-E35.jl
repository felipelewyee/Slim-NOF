using DoNOF

mol = """
0 1
   C         -1.00303574     -0.68897010      0.00000000
   S         -0.52402870      1.07825253      0.00000000
   C          1.25183643      0.91046095      0.00000000
   O          1.86065030     -0.12619903      0.00000000
   H         -2.09086651     -0.71431765      0.00000000
   H         -0.61640426     -1.18018000     -0.88945379
   H         -0.61640426     -1.18018000      0.88945379
   H          1.73825273      1.90113330      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E35"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
