set title "Histogram of exponentially distributed random numbers"
set style data histograms
set style fill solid border
set yrange [0:1000]
set xtic rotate by -45 scale 0
plot './pce145.dat' using 2:xtic(1)
