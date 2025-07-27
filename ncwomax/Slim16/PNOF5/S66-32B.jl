using DoNOF

mol = """
0 1
C          0.574568113944   -0.186907465149   -0.049632280010
H          1.570386383639   -0.540893318327   -0.163851010181
C         -0.570035971431    0.199550220565    0.056559562096
H         -1.574918526152    0.528250562911    0.156923728096
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-32B"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
