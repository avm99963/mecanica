#!/usr/bin/gnuplot -c
# File name definition
outputsdir = 'simpleoutputs/'
filename = 'q7';

# Output in TEX
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# PLOT SETTINGS
set xlabel "$l \\; (m)$"
set ylabel "$\\sqrt{\\omega}$"
set key above
set key spacing 1.5
#set key off
#set ytics 20
#set logscale xy

# FIT SETTINGS
#f(x) = a*x + b
#fit f(x) datafitfile u 1:2 via a, b
#stats datafitfile u 1:2 name "A"
#title_f(a, b, r) = sprintf('$\sqrt{\omega_-}(l) = %.5fl + %.3f$, $r = %.5f$', a, b, r);

f(x) = sqrt(0.5*(sqrt(1+2*x*x) - 1))
g(x) = sqrt(0.5*x*x)

#plot "data.dat" t "Dades experimentals", f(x) t title_f(a, b, A_correlation)
plot [0:100] f(x) w l t "$\\sqrt{\\omega_-}$", g(x) w l dt (30, 8, 2, 8) t "$\\sqrt{\\widetilde{\\omega_-}}$"

# Output in SVG
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

