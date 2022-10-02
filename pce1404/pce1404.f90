! Programs involving graphs require gnuplot
! Assuming you are in a Unix like system and you have
! gnufortran and gnuplot installed follow the instructions:
! - Navigate to the containing directory
! - Compile program:
!       gfortran pce144.f90 -o pce144.o
! - Run the executable:
!       ./pce144.o
! - Plot the generated file
!       gnuplot -p pce144.dat
program pce144
  implicit none

  integer, parameter :: POINTS = 10**4
  real, parameter :: DOWN = 0
  real, parameter :: UP = 1
  real, parameter :: DELTA_X = 5.0/10**2
  integer, parameter :: BINS = int((UP - DOWN)/DELTA_X)
  character(len=*), parameter :: OUT_FILE = 'pce144.dat'

  real :: uniform(POINTS)
  integer :: histogram(BINS)

  integer :: i, j, k, fu, bin_count
  real :: sub_up, sub_down

  call random_seed()
  call random_number(uniform)

  ! Count points in each interval i.e. bin your data
  do i = 1, BINS
    sub_up = i*DELTA_X
    sub_down = sub_up - DELTA_X
    bin_count = 0
    do j = 1, POINTS
      if (sub_down <= uniform(j) .and. uniform(j) <= sub_up) then
        bin_count = bin_count + 1
      end if
    end do
    histogram(i) = bin_count
  end do

  ! Create file with the binned data
  open(action='write', file=OUT_FILE, newunit=fu, status='replace')
    do k = 1, BINS
      sub_up = k*DELTA_X
      write(fu, *) sub_up, histogram(k)
    end do
  close(fu)
end program pce144
