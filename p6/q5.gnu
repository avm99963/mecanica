#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'output/'
filename = 'q5';
datafile = 'data/q5.dat'

# Output in TEX
set terminal cairolatex size 12.72cm, 8.9cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$d^2 \\; (\\si{\\cm^2})$"
set ylabel "$I \\; (\\si{\\g \\cdot \\cm^2})$"
set key spacing 1.5
set key above
#set key off
#set ytics 20
#set logscale xy

# FIT SETTINGS
f(x) = a*x + b
fit f(x) datafile u 3:1 via a, b
stats datafile u 3:1 name "A"
title_f(a, b, r) = sprintf('$I(d^2) = %.0fd^2 + %.0f$, $r = %.1f$', a, b, r);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u 3:1:2 w yerr t "$I$", f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

