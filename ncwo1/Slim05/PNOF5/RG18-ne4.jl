using DoNOF

mol = """
0 1
Ne    1.1071155   -1.1071155    1.1071155 
Ne   -1.1071155    1.1071155    1.1071155 
Ne   -1.1071155   -1.1071155   -1.1071155 
Ne    1.1071155    1.1071155   -1.1071155 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-ne4"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
