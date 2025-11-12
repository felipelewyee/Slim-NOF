using DoNOF

mol = """
-1 1
  N     -6.06210759      1.07714827      0.12402691
  N     -4.94801541      1.43880837      0.40939133
  N     -7.18169655      0.75794183     -0.14863494
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-13A"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
