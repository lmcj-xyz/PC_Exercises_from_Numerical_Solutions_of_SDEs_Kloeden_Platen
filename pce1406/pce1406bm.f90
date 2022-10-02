! Programs involving graphs require gnuplot
! Assuming you are in a Unix like system and you have
! gnufortran and gnuplot installed follow the instructions:
! - Navigate to the containing directory
! - Compile program:
!       gfortran pce146bm.f90 -o pce146bm.o
! - Run the executable:
!       ./pce146bm.o
! - Plot the generated file
!       gnuplot -p pce146bm.dat
program pce146bm
  implicit none

  real(10), parameter :: PI = 4*atan(1.d0) ! Definition of PI
  integer, parameter :: POINTS = 10**4
  real, parameter :: DOWN = -2.5
  real, parameter :: UP = 2.5
  integer, parameter :: BINS = 10**2
  real, parameter :: DELTA_X = (UP - DOWN)/BINS
  character(len=*), parameter :: OUT_FILE = 'pce146bm.dat'

  real :: uniform1(POINTS)
  real :: uniform2(POINTS)
  real :: gaussian(POINTS)
  integer :: histogram(BINS)

  integer :: i, j, k, fu, bin_count
  real :: sub_up, sub_down

  call random_seed()
  call random_number(uniform1)
  call random_number(uniform2)
  gaussian = sqrt(-2*log(uniform1))*cos(2*PI*uniform2)

  ! Count points in each interval i.e. bin your data
  do i = 1, BINS
    sub_up = i*DELTA_X
    sub_down = sub_up - DELTA_X
    bin_count = 0
    do j = 1, POINTS
      if (sub_down <= gaussian(j) .and. gaussian(j) <= sub_up) then
        bin_count = bin_count + 1
      end if
    end do
    histogram(i) = bin_count
  end do

  ! Create file with the binned data
  open(action='write', file=OUT_FILE, newunit=fu, status='replace')
    do k = 1, BINS/2
      sub_up = -k*DELTA_X
      write(fu, *) sub_up, histogram(k)
    end do
    do k = 1, BINS/2
      sub_up = k*DELTA_X
      write(fu, *) sub_up, histogram(k)
    end do
  close(fu)
end program pce146bm
