#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'simpleoutputs/'
filename = ARG2;
datafile = ARG1

# Output in TEX
set terminal cairolatex size 15cm, 8cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$t$ (s)"
set ylabel "$\\varphi$"
set key above
#set key off
#set ytics 20
#set logscale xy

# FIT SETTINGS
#f(x) = a*sin(b*x + c) + d
#fit f(x) datafitfile u 1:2 via a, b, c, d
#title_f(a, b, r) = sprintf('$h(t) = %.4ft + (%.4f)$, $r = %.4f$', a, b, r);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u 1:2 w l t "$\\varphi_1$", datafile u 1:3 w l dt (30, 8, 2, 8) t "$\\varphi_2$"#, f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 300 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

