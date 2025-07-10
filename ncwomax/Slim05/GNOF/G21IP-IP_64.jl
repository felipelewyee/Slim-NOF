using DoNOF

mol = """
1 2
   Si        -0.00061188     -0.67853868     -0.32596358
   H          0.00370443      1.16422482     -0.61329630
   H         -0.00028384      1.19708060      0.17207024
   H          1.28833385     -0.84467921      0.38450894
   H         -1.29114256     -0.83808753      0.38268070
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21IP-IP_64"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
