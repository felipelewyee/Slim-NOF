using DoNOF

mol = """
-1 1
  N     -1.73329119      3.59149372      0.14063878
  N     -1.21103786      2.50571306      0.11806779
  N     -2.25487580      4.67309593      0.15983177
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-14A"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
