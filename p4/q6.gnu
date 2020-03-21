#!/usr/bin/gnuplot -c
# File name definition
filename = 'q6'
outputsdir = 'outputs/'
datafile = 'data/q6.dat'
datafitfile = 'data/q6.dat'

# Output in TEX
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$\\omega_a \\; (\\si{\\radian\\per\\s})$"
set ylabel "$\\varphi_a$"
set key above
#set key off
#set ytics 20

stats datafitfile u 1:3 name "A"

# FIT SETTINGS
#f(x) = a*x + b
#fit f(x) datafitfile u 1:(log($2)) via a, b
#title_f(a, b, r) = sprintf('$\log (\varphi(t)) = %.3f \cdot t + %.3f$, $r = %.3f$', a, b, r);

plot datafile u 1:3:2:4 t "Dades experimentals" w xyerr#, f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

