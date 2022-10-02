! Programs involving graphs require gnuplot
! Assuming you are in a Unix like system and you have
! gnufortran and gnuplot installed follow the instructions:
! - Navigate to the containing directory
! - Compile program:
!       gfortran pce1406pm.f90 -o pce1406pm.o
! - Run the executable:
!       ./pce1406pm.o
! - Plot the generated file
!       gnuplot -p pce1406pm.dat
program pce1406pm
  implicit none

  integer, parameter :: POINTS = 10**4
  real, parameter :: DOWN = -2.5
  real, parameter :: UP = 2.5
  integer, parameter :: BINS = 10**2
  real, parameter :: DELTA_X = (UP - DOWN)/BINS
  character(len=*), parameter :: OUT_FILE = 'pce1406pm.dat'

  real :: uniform1
  real :: uniform2
  real :: vuniform1
  real :: vuniform2
  real :: wuniform
  real :: gaussian(POINTS)
  integer :: histogram(BINS)

  integer :: i, j, k, l, fu, bin_count
  real :: sub_up, sub_down

  call random_seed()
  ! Gaussian RV Polar Marsaglia
  l = 1
  do while (l <= POINTS)
    call random_number(uniform1)
    call random_number(uniform2)
    vuniform1 = 2*uniform1 - 1 ! Helper uniform RVs
    vuniform2 = 2*uniform2 - 1
    wuniform = vuniform1**2 + vuniform2**2
    if (wuniform <= 1) then ! Condition for the generation
      gaussian(l) = vuniform1*sqrt(-2*log(wuniform)/wuniform)
      l = l + 1
    end if
  end do

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
    do k = 1, BINS
      write(fu, *) histogram(k)
    end do
  close(fu)
end program pce1406pm
