using DoNOF

mol = """
-1 1
 Cl     -1.08432470     -0.37737497      0.80154747
  H     -0.91892476      0.27674122     -0.59444772
 Cl     -0.75489014      0.93320944     -1.99831453
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-8"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
