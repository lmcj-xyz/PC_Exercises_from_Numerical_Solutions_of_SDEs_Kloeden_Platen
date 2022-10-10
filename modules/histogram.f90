! Bin data to create a histogram and returns a file ready to plot
module histogram
contains
  subroutine histogram(dat, x_start, x_end, bins, hist_file)
    real, intent(in) :: dat(:)
    real, intent(in) :: x_start
    real, intent(in) :: x_end
    integer, intent(in) :: bins
    character(len=*), intent(inout) :: hist_file

    integer :: i, j, k, fu, bin_count
    real :: sub_up, sub_down

    real, intent(in), parameter :: dx = (x_start - x_end)/bins
    real, intent(in), parameter :: points = size(dat)
    integer :: hist_array(bins)

    ! Count points in each interval i.e. bin your data
    do i = 1, bins
      sub_up = i*dx
      sub_down = sub_up - dx
      bin_count = 0
      do j = 1, points
        if (sub_down <= dat(j) .and. dat(j) <= sub_up) then
          bin_count = bin_count + 1
        end if
      end do
      hist_array(i) = bin_count
    end do

    ! Create file with the binned data
    open(action='write', file=hist_file, newunit=fu, status='replace')
      do k = 1, bins
        write(fu, *) hist_array(k)
      end do
    close(fu)
end module histogram
