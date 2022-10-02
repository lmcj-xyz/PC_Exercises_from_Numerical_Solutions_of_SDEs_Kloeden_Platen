set title "Histogram of uniformly distributed random numbers"
set style data histograms
set style fill solid border
set yrange [0:650]
set ylabel 'Frequency'
set xrange [0:20]
set xlabel 'Value'
set for [i=1:20] xtics (i/(5*10**2))
plot './pce1404.dat' title 'Frequency'
