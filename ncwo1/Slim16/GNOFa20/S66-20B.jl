using DoNOF

mol = """
0 1
C         -0.554398079827   -0.153346916572   -0.040321527822
O         -1.258016444989   -1.126661404652   -0.280109129989
O         -1.026824413864    1.049088471094    0.247456943051
H         -2.020612953841    1.016190237533    0.233056438884
C          0.942314368065   -0.199249662493   -0.042285923200
H          1.279893932100   -1.200568855630   -0.279811418044
H          1.323812913169    0.511103276340   -0.771754820792
H          1.313830679186    0.103444854486    0.933769437857
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-20B"

p.ipnof = 8
p.ista = 4
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
