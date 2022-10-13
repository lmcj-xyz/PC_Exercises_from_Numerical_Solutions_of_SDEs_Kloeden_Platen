! Subroutines to generate random numbers with different distributions
module random_numbers
contains
  ! Exponential by inverse transform
  subroutine exponential(array, lambda)
    implicit none
    real, intent(inout) :: array(:) ! Exponential
    real, intent(in) :: lambda ! Lambda parameter, hast to be lambda>0

    real :: u
    integer :: i

    call random_seed()
    do i = 1, size(array)
      call random_number(u)
      array(i) = -log(u)/lambda
    end do
  end subroutine exponential

  ! Gaussian by Box-Muller
  subroutine normal_bm(array)
    implicit none
    real, intent(inout) :: array(:)
    real :: u1, u2
    integer :: i
    real(10), parameter :: PI = 4*atan(1.d0) ! Definition of PI

    call random_seed()
    do i = 1, size(array)
      call random_number(u1)
      call random_number(u2)
      array(i) = sqrt(-2*log(u1))*cos(2*PI*u2)
    end do
  end subroutine normal_bm

  ! Gaussian Polar Marsaglia
  subroutine normal_pm(array)
    implicit none
    real, intent(inout) :: array(:)
    real :: u1, u2, v1, v2, w
    integer :: k

    k = 1
    do while (k <= size(array))
      call random_number(u1)
      call random_number(u2)
      v1 = 2*u1 - 1
      v2 = 2*u2 - 1
      w = v1**2 + v2**2
      if (w <= 1) then
        array(k) = v1*sqrt(-2*log(w)/w)
        k = k+1
      end if
    end do
  end subroutine normal_pm
end module random_numbers
