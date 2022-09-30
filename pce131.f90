program pce131
  implicit none

  real(10), parameter :: PI = 4*atan(1.d0) ! Definition of PI

  real :: unif_exp_invtr(10**2) ! Uniform RV for exponential distribution with inverse transform
  real :: unif_gauss_bm1(10**2) ! Uniform RV for Gaussian with Box-Muller
  real :: unif_gauss_bm2(10**2)
  real :: unif_gauss_pm1(10**2) ! Uniform RV for Gaussian with Polar Marsaglia
  real :: unif_gauss_pm2(10**2) 

  real :: exp_dist(10**2) ! Exponential RV with inverse transform method
  real :: lambda ! Parameter lambda for exponential RV

  real :: gauss_bm(10**2) ! Gaussian RV Box-Muller

  real :: gauss_pm(10**2) ! Gaussian RV Polar Marsaglia

  call random_seed() ! Create a seed to generate pseudo random numbers

  ! Fill the arrays with random numbers
  call random_number(unif_exp_invtr)
  call random_number(unif_gauss_bm1)
  call random_number(unif_gauss_bm2)
  call random_number(unif_gauss_pm1)
  call random_number(unif_gauss_pm2)

  ! Exponentially distributed random numbers
  !!! It suffices to use a uniform RV U~uniform(0,1) instead of 1 - U
  !!! since their distribution is the same
  lambda = 0.5
  exp_dist = -log(unif_exp_invtr)/lambda

  ! Gaussian random numbers Box-Muller
  gauss_bm = sqrt(-2*log(unif_gauss_bm1))*cos(2*PI*unif_gauss_bm2)

  ! Gaussian random numbers Polar Marsaglia

end program pce131
