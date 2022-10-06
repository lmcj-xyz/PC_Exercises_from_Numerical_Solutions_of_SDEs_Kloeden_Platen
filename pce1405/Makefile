# Configuration
FC := gfortran
PLT := pce1405.plt
SRCS := pce1405.f90 random_numbers.f90


plot: pce1405.dat
	./pce1405
	gnuplot -p pce1405.plt
pce1405.dat: pce1405.o pce1405
	gfortran -o pce1405 pce1405.o ../modules/random_numbers.o
pce1405.o: pce1405.f90 ../modules/random_numbers.mod
	gfortran -c pce1405.f90 -I ../modules
pce1404.f90:
	touch pce1405.f90
../modules/random_numbers.mod: ../modules/random_numbers.f90
	cd ../modules/
	gfortran -c random_numbers.f90
	cd ../pce1405/
../modules/random_numbers.f90:
	cd ../modules/
	touch random_numbers.f90
	cd ../pce1405/
