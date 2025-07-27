using DoNOF

mol = """
0 1
   C          0.22259261      1.42799824      0.02723212
   C         -0.97436067      0.49751732     -0.13040234
   C         -0.41680159     -0.87383441      0.25408917
   C          1.06882306     -0.72158796     -0.09552632
   O          1.36453911      0.68260636      0.07749466
   O          0.23335206      2.62270430      0.09577057
   H         -1.29093815      0.53692761     -1.17703084
   H         -1.80453121      0.84823173      0.47961716
   H         -0.53487842     -1.04496283      1.32593980
   H         -0.88192764     -1.70472729     -0.27573787
   H          1.27495174     -0.98951300     -1.13553107
   H          1.73917910     -1.28136005      0.55408495
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E31"

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
