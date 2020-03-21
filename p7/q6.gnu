#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'output/'
filename = 'q6';
datafile = 'data/q3.dat'
datafitfile = 'data/q3fit.dat'

# Output in TEX
set terminal cairolatex size 12.72cm, 8.9cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$b \\; (\\si{\\mm})$"
set ylabel "$\\cos\\left(\\frac{\\phi}{2}\\right))$"
set key spacing 1.5
set key above
#set key off
#set ytics 20
#set logscale xy

# FIT SETTINGS
r = 2.990 # Custom variables
R = 40
f(x) = (x - a)/(r + R)
fit f(x) datafitfile u 1:2 via a
#stats datafile u 1:2 name "A"
title_f(r, a) = sprintf('$\cos\left( \frac{\phi}{2} \right) (b) = \frac{b}{%.3f + %.3f}$', r, a);

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot datafile u ($1 + a):2:3 w yerr t "Dades experimentals", f(x) t title_f(r, a)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

