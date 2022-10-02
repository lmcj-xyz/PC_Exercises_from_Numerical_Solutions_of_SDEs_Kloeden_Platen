set title "Histogram of normally distributed random numbers generated with the Box-Muller method"
set style data histograms
set style fill solid border
set yrange [0:250]
set xtic rotate by -45 scale 0
plot './pce146bm.dat' using 2:xtic(1)
