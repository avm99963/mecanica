#!/usr/bin/gnuplot -c
# File name definition
filename = 'q5'
outputsdir = '../outputs/'
datafile = 'data.dat'
datafitfile = 'datafit.dat'

# Output in TEX
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$t_1$ (s)"
set ylabel "$v \\; \\si{\\cm\\per\\s}$"
set key above
#set key off
#set ytics 20
#set logscale xy

a = 1
b = 10

# FIT SETTINGS
f(x) = a*(1-exp(-b*x))
fit f(x) datafitfile u 1:2 via a, b
stats datafitfile u 1:2 name "A"
title_f(a, b, r) = sprintf('$v(t) = %.1f\cdot(1-e^{-%.3f\cdot t})$, $r = %.4f$', a, b, r);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u 1:2:(0.001):3 t "Dades experimentals" w xyerr, f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

