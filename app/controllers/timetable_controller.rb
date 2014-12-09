class TimetableController < ApplicationController
  def index
    tt         = TimetableService.new
    @tablo_in  = tt.get_schedule(:today, :in)
    @tablo_out = tt.get_schedule(:today, :out)
  end
end
