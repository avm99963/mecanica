#!/usr/bin/gnuplot -c
# == DEFINICIÓ DELS NOMS DELS ARXIUS ==
filename = 'q1' # Nom de la imatge resultant (sense extensió)
outputsdir = '../outputs/' # Carpeta on es volen guardar les imatges resultants (si es volen guardar a
                           # la mateixa carpeta es pot deixar com '' i ja està)
datafile = 'data.dat' # Nom del fitxer de dades que es vol usar
datafitfile = 'datafit.dat' # Es pot configurar a un altre fitxer si es volen fitar només algunes dades,
                            # per exemple un altre fitxer on es treuen els punts que estan molt desalineats

# == CONFIGURACIÓ DE L'OUTPUT PEL LATEX ==
set terminal cairolatex size 10cm, 7cm
set output outputsdir.filename.'.tex'

# == CONFIGURACIÓ DEL PLOT ==
set xlabel "$t_1$ (A)"
set ylabel "h (cm)"

# Opcions per la llegenda:
set key above
set key spacing 1.5
#set key off

set ytics 20 # Defineix la resolució de l'eix de les ys (i "xtics" el de l'eix de les xs)
#set logscale xy # Si es vol usar escala logarítmica, es pot descomentar-ho i usar "xy" per doble logarítmica,
                 # o "x" o "y" si es vol usar només l'escala logarítmica en un dels eixos.

# == CONFIGURACIÓ DEL FIT ==

f(x) = a*x + b # Funció a fitar
fit f(x) datafitfile u 1:2 via a, b # Fem el fit de les dades

# Això s'usa per obtenir el valor del coeficient de correlació "r", que estarà guardat a la var. "A_correlation"
stats datafitfile u 1:2 name "A"

# Aquesta funció escriu, a partir dels valors del paràmetres a, b i r, l'equació de la regressió:
title_f(a, b, r) = sprintf('$h(t) = %.4ft + (%.4f)$, $r = %.4f$', a, b, r);

plot datafile u 1:2:(0.001):(0.5) t "Dades experimentals" w xyerr, f(x) t title_f(a, b, A_correlation) # Fem el plot!!
#          Barres d'error -^          Pintar barres d'error -^      Funcio que escriu el títol -^

# == CONFIGURACIÓ DE L'OUTPUT PER SVG ==
# Això ho uso per generar també una imatge de previsualització que puc carregar a l'ordinador per veure més o menys
# com a sortit el plot sense haver d'inserir-ho al LaTeX per veure-ho.
set terminal svg dashed size 600, 600 font "Computer Modern,Tinos,Helvetica,15"
set output outputsdir.filename.'.svg'

replot

