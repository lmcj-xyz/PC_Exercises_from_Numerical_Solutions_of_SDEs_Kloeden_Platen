set title "Histogram of uniformly distributed random numbers"
set style data histograms
set style fill solid border
set yrange [0:650]
set xtic rotate by -45 scale 0
plot './pce144.dat' using 2:xtic(1)
