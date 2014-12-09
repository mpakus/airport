class TimetableController < ApplicationController
  def index
    tt         = TimetableService.new
    @tablo_in  = tt.get_schedule(:today, :in)
    @tablo_out = tt.get_schedule(:today, :out)

    @tablo_in_tomorrow  = tt.get_schedule(:tomorrow, :in)
    @tablo_out_tomorrow = tt.get_schedule(:tomorrow, :out)
  end
end
