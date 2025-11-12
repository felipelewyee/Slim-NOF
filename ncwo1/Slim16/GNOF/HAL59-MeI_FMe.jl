using DoNOF

mol = """
0 1
   C     1.063213    2.394112    0.000000
   I     0.000000    0.549601    0.000000
   H     0.786114    2.944863    0.891582
   H     2.125112    2.176413    0.000000
   H     0.786114    2.944863   -0.891582
   H    -0.074575   -3.863191   -0.894505
   H    -0.074575   -3.863191    0.894505
   F    -1.165488   -2.418227    0.000000
   H     0.845164   -2.615977    0.000000
   C    -0.047207   -3.242210    0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI_FMe"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
