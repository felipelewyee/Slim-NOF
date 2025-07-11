using DoNOF

mol = """
1 1
N     0.0000000    0.0000000    0.0000000 
H     0.5918670   -0.5918670    0.5918670 
H    -0.5918670    0.5918670    0.5918670 
H    -0.5918670   -0.5918670   -0.5918670 
H     0.5918670    0.5918670   -0.5918670 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-nh3p"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = nothing#DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
