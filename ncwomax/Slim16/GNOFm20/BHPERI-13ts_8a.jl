using DoNOF

mol = """
0 1
   C         -1.23057941      0.50086096      0.10676486
   C         -1.21313991     -0.87689747      0.07966200
   N          1.04747730     -1.33943784     -0.09695831
   N          1.41930914     -0.13949867      0.31481262
   C          0.94113040      1.02188963     -0.16660748
   H         -1.55687399      1.05985239     -0.76315460
   H         -1.33110873      1.02587973      1.04980549
   H         -1.46424394     -1.41746083     -0.82546542
   H         -1.24165957     -1.45884030      0.99008609
   H          0.85567977     -1.25245686     -1.09541302
   H          1.69857786     -0.13681876      1.28956068
   H          1.24615647      1.92097778      0.35709063
   H          0.82927461      1.09195023     -1.24018353
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_8a"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
