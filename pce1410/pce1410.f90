program pce1410
  use random_numbers, only: exponential
  implicit none

  integer, parameter :: POINTS = 10**3 !! You can change this number to see the behaviour
  real, parameter :: LAMBDA = 0.5
  real :: av, sum_ge_a, av_a(4), exp_rv(POINTS)
  integer :: a, i, points_a

  call exponential(exp_rv, LAMBDA)

  do a = 1, 4
    sum_ge_a = 0
    points_a = 0
    do i = 1, POINTS
      if (exp_rv(i) >= a) then
        sum_ge_a = sum_ge_a + exp_rv(i)
        points_a = points_a + 1
      end if
    end do
    av_a(a) = sum_ge_a/points_a
  end do

  av = sum(exp_rv)/POINTS

  print *, "Theoretical average      = ", 1/LAMBDA
  print *, "Empirical average        = ", av
  print *, "Let a = 1, 2, 3, 4, then"
  print *, "Theoretical average >= a = ", 1 + 1/LAMBDA, 2 + 1/LAMBDA, 3 + 1/LAMBDA, 4 + 1/LAMBDA
  print *, "Empirical average   >= a = ", av_a
end program pce1410
