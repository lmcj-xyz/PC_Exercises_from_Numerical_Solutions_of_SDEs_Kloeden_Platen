program pce131
  implicit none

  real(10), parameter :: PI = 4*atan(1.d0) ! Definition of PI
  integer, parameter :: POINTS = 10**2 ! Number of points to generate

  integer :: k ! Counter for while loop in Polar Marsaglia method

  real :: unif_exp_invtr(POINTS) ! Uniform RV for exponential distribution with inverse transform
  real :: unif_gauss_bm1(POINTS) ! Uniform RV for Gaussian with Box-Muller
  real :: unif_gauss_bm2(POINTS)
  real :: unif_gauss_pm1 ! Uniform RV for Gaussian with Polar Marsaglia
  real :: unif_gauss_pm2 
  real :: vunif_gauss_pm1
  real :: vunif_gauss_pm2
  real :: wunif_gauss_pm

  real :: exp_dist(POINTS) ! Exponential RV with inverse transform method
  real :: lambda ! Parameter lambda for exponential RV

  real :: gauss_bm(POINTS) ! Gaussian RV Box-Muller

  real :: gauss_pm(POINTS) ! Gaussian RV Polar Marsaglia

  call random_seed() ! Create a seed to generate pseudo random numbers

  ! Fill the arrays with random numbers
  call random_number(unif_exp_invtr)
  call random_number(unif_gauss_bm1)
  call random_number(unif_gauss_bm2)

  ! Exponentially distributed random numbers
  !!! It suffices to use a uniform RV U~uniform(0,1) instead of 1 - U
  !!! since their distribution is the same
  lambda = 0.5
  exp_dist = -log(unif_exp_invtr)/lambda

  ! Gaussian random numbers Box-Muller
  gauss_bm = sqrt(-2*log(unif_gauss_bm1))*cos(2*PI*unif_gauss_bm2)

  ! Gaussian random numbers Polar Marsaglia
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
