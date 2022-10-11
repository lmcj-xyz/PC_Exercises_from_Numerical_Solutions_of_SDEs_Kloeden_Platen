! Programs involving graphs require gnuplot
! Assuming you are in a Unix like system and you have
! gnufortran and gnuplot installed follow the instructions:
! - Navigate to the containing directory
! - Compile program:
!       gfortran pce145.f90 -o pce145.o
! - Run the executable:
!       ./pce145.o
! - Plot the generated file
!       gnuplot -p pce145.dat
program pce1405
  use random_numbers
  use histogram
  implicit none

  integer, parameter :: POINTS = 10**4
  real, parameter :: DOWN = 0
  real, parameter :: UP = 2
  real, parameter :: DELTA_X = 5.0/10**2
  real, parameter :: LAMBDA = 2
  integer, parameter :: BINS = int((UP - DOWN)/DELTA_X)
  character(len=*), parameter :: OUT_FILE = 'pce1405.dat'

  !real :: uniform(POINTS)
  real :: exponential_array(POINTS)
  !integer :: histogram(BINS)

  integer :: i, j, k, fu, bin_count
  real :: sub_up, sub_down

  !call random_seed()
  !call random_number(uniform)
  call exponential(exponential_array, LAMBDA)
  call hist(exponential_array, DOWN, UP, BINS, OUT_FILE)

end program pce1405
