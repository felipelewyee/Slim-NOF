using DoNOF

mol = """
0 1
N         -0.229345409277   -0.708649435882   -0.535982633208
H          0.066923260748   -0.434111700981   -1.463967876502
H          0.394204257637   -1.456339751910   -0.260787770234
C         -0.069115433328    0.426561156949    0.377692670847
H         -0.339305737415    0.111865376710    1.383345779611
H          0.938294877758    0.848337716107    0.414664404502
H         -0.761655816229    1.212336638955    0.085035424878
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-10B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
