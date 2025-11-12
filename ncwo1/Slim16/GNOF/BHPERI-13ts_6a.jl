using DoNOF

mol = """
0 1
   C          1.27609040     -0.77327344      0.00000000
   C          1.23134723      0.58905339      0.00000000
   C         -1.18192378      1.07324973      0.00000000
   N         -1.49435191     -0.19905547      0.00000000
   C         -1.06638519     -1.33840171      0.00000000
   H          1.42015815     -1.33084885     -0.91708935
   H          1.42015815     -1.33084885      0.91708935
   H          1.34536200      1.15022023     -0.91956788
   H          1.34536200      1.15022023      0.91956788
   H         -1.30031450      1.61932430      0.92900354
   H         -1.30031450      1.61932430     -0.92900354
   H         -1.69518802     -2.22896383      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_6a"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
