#!/usr/bin/gnuplot -c
# File name definition
filename = 'q6'
outputsdir = '../outputs/'
datafile = 'data.dat'
datafitfile = 'data.dat'

# Output in TEX
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$\\rho \\; (\\SI{e-16}{\\ohm\\cm})$"
set ylabel "$b \\; \\si{\\kg\\per\\s}$"
set key above
#set key off
#set ytics 20

stats datafitfile u (log($1)):(log($2)) name "A"

set logscale xy

# FIT SETTINGS
f(x) = a*(x**b)
fit f(x) datafitfile u 1:2 via a, b
title_f(a, b, r) = sprintf('$b(\rho) = %.0f\cdot\rho^{%.3f}$, $r = %.3f$', a, b, r);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u 1:2:3 t "Dades experimentals" w yerr, f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

