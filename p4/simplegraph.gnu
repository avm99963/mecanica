#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'simpleoutputs/'
filename = ARG2;
datafile = ARG1

# Output in TEX
set terminal cairolatex size 10cm, 5cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$t$ (s)"
set ylabel "$\\theta$"
#set key above
set key off
#set ytics 20
#set logscale xy

# FIT SETTINGS
#f(x) = a*sin(b*x + c) + d
#fit f(x) datafitfile u 1:2 via a, b, c, d
#title_f(a, b, r) = sprintf('$h(t) = %.4ft + (%.4f)$, $r = %.4f$', a, b, r);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u 1:2 with dots t "Dades experimentals"#, f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 300 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

