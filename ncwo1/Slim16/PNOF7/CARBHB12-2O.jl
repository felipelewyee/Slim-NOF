using DoNOF

mol = """
0 1
O    -2.6230507    0.0983053   -0.2620611 
H    -1.6716484    0.0200216   -0.4294782 
H    -2.8369391    0.9964234   -0.5148255 
C     0.4073302   -0.0340636   -0.5409216 
Cl    1.3208633   -0.1895449   -1.9641069 
C     1.2421153   -0.1696644    0.6612515 
H     2.3287649   -0.1804742    0.5550829 
H     0.9214309    0.5791287    1.3905426 
H     0.9111337   -1.1201319    1.1045163 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2O"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
