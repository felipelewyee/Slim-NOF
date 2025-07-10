using DoNOF

mol = """
0 2
   H          0.55168779      0.15329813     -0.95936966
   C          0.11680895     -0.08885399      0.00000000
   F         -1.22018453     -0.21774228      0.00000000
   H          0.55168779      0.15329813      0.95936966
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P20"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
