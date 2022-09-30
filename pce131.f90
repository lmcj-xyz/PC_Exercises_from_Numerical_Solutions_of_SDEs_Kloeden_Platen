program pce131
  implicit none

  real :: unif_exp_invtr(10**2) ! Uniform RV for exponential distribution with inverse transform
  real :: unif_gauss_bm1(10**2) ! Uniform RV for Gaussian with Box-Muller
  real :: unif_gauss_bm2(10**2)
  real :: unif_gauss_pm1(10**2) ! Uniform RV for Gaussian with Polar Marsaglia
  real :: unif_gauss_pm2(10**2) 

  real :: exp_dist(10**2) ! Exponential RV with inverse transform method

  call random_seed() ! Create a seed to generate pseudo random numbers

  ! Fill the arrays with random numbers
  call random_number(unif_exp_invtr)
  call random_number(unif_gauss_bm1)
  call random_number(unif_gauss_bm2)
  call random_number(unif_gauss_pm1)
  call random_number(unif_gauss_pm2)

  ! Exponentially distributed random numbers
  

end program pce131
