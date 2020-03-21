#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'fitoutputs/'
filename = ARG2
datafile = ARG1

# Output in TEX
set terminal cairolatex size 10cm, 5cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$t$ (s)"
set ylabel "$\\theta$"
set key above

# FIT SETTINGS
set fit quiet
set fit logfile outputsdir.filename.'_fit.log'
if (exists("ARG3")) { a = ARG3 + 0 }
if (exists("ARG4")) { b = ARG4 + 0 }
if (exists("ARG5")) { c = ARG5 + 0 }
f(x) = a*sin(b*x + c) + d
fit f(x) datafile u 1:2 via a, b, c, d
title_f(a, b, r) = sprintf('$\theta(t) = %.2f\cdot(%.2f \cdot x + %.2f) + %.2f$', a, b, c, d);

# PLOT THE DATA
plot datafile u 1:2 with dots t "Dades experimentals", f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 300 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

