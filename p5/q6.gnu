#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'simpleoutputs/'
filename = 'q6';
datafile = 'otherdata/q6.dat'
datafitfile = 'otherdata/q6fit.dat'

# Output in TEX
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$l$ (cm)"
set ylabel "$\\sqrt{\\omega_-}$"
set key above
set key spacing 1.5
#set key off
#set ytics 20
#set logscale xy

# FIT SETTINGS
f(x) = a*x + b
fit f(x) datafitfile u 1:2 via a, b
stats datafitfile u 1:2 name "A"
title_f(a, b, r) = sprintf('$\sqrt{\omega_-}(l) = %.5fl + %.3f$, $r = %.5f$', a, b, r);


#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot [10:80][0.1:0.6] datafile u 1:2:(2):3 w xyerr t "Dades", f(x) t title_f(a, b, A_correlation)

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

