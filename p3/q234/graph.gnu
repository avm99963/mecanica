#!/usr/bin/gnuplot -c
# File name definition
filename = 'q'.ARG1
outputsdir = '../outputs/'
datafile = 'data'.ARG1.'.dat'
datafitfile = 'datafit'.ARG1.'.dat'
print datafile

# Output in TEX
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$t_1$ (A)"
set ylabel "h (cm)"
set key above
#set key off
set ytics 20
#set logscale xy

# FIT SETTINGS
f(x) = a*x + b
fit f(x) datafitfile u 2:1 via a, b
stats datafitfile u 2:1 name "A"
title_f(a, b, r) = sprintf('$h(t) = %.4ft + (%.4f)$, $r = %.4f$', a, b, r);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u 2:1:(0.001):(0.5) t "Dades experimentals" w xyerr, f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

