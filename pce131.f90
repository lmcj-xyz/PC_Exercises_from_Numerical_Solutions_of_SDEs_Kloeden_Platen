program pce131
  implicit none

  ! Constants
  real(10), parameter :: PI = 4*atan(1.d0) ! Definition of PI
  integer, parameter :: POINTS = 10**2 ! Number of points to generate

  ! Variables for two-point RV
  real :: unif_two_point(POINTS) ! Uniform
  real :: two_point(POINTS) ! Two-point
  real :: p1 ! Probability
  real :: x1 ! Point 1
  real :: x2 ! Point 2
  integer :: j ! Counter for while loop

  ! Variables for inverse transform
  real :: exp_dist(POINTS) ! Exponential
  real :: unif_exp_invtr(POINTS) ! Uniform RV
  real :: lambda ! Parameter lambda for exponential RV

  ! Variables for Polar Marsaglia method
  real :: gauss_bm(POINTS) ! Gaussian
  real :: unif_gauss_bm1(POINTS) ! Uniform
  real :: unif_gauss_bm2(POINTS)

  ! Variables for Polar Marsaglia method
  real :: gauss_pm(POINTS) ! Gaussian
  real :: unif_gauss_pm1 ! Uniform
  real :: unif_gauss_pm2 
  real :: vunif_gauss_pm1
  real :: vunif_gauss_pm2
  real :: wunif_gauss_pm
  integer :: k ! Counter for while loop

  ! Create a seed to generate pseudo random numbers
  call random_seed()

  ! Two point RV
  call random_number(unif_two_point)
  p1 = 0.3
  x1 = 1
  x2 = 0
  do while (j <= POINTS)
    if (0 <= unif_two_point(j) .and. unif_two_point(j) <= p1) then
      two_point(j) = x1
    else if (p1 <= unif_two_point(j) .and. unif_two_point(j) <= 1) then
      two_point(j) = x2
    end if
  end do

  ! Exponential RV
  !!! It suffices to use a uniform RV U~uniform(0,1) instead of 1 - U
  !!! since their distribution is the same
  call random_number(unif_exp_invtr)
  lambda = 0.5
  exp_dist = -log(unif_exp_invtr)/lambda

  ! Gaussian RV Box-Muller
  call random_number(unif_gauss_bm1)
  call random_number(unif_gauss_bm2)
  gauss_bm = sqrt(-2*log(unif_gauss_bm1))*cos(2*PI*unif_gauss_bm2)

  ! Gaussian RV Polar Marsaglia
  k = 1
  do while (k <= POINTS)
    call random_number(unif_gauss_pm1)
    call random_number(unif_gauss_pm2)
    vunif_gauss_pm1 = 2*unif_gauss_pm1 - 1
    vunif_gauss_pm2 = 2*unif_gauss_pm2 - 1
    wunif_gauss_pm = vunif_gauss_pm1**2 + vunif_gauss_pm2**2
    if (wunif_gauss_pm <= 1) then
      gauss_pm(k) = wunif_gauss_pm
      k = k + 1
    end if
  end do
end program pce131
