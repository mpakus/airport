require 'rufus-scheduler'


#if Rails.env.production?
scheduler = Rufus::Scheduler.new
scheduler.every "5m" do
  tt = TimetableService.new
  tt.request_for(:today, :in)
  tt.request_for(:today, :out)
end

scheduler.every "1h" do
  tt = TimetableService.new
  tt.request_for(:yesterday, :in)
  tt.request_for(:yesterday, :out)
end

scheduler.every "10m" do
  tt = TimetableService.new
  tt.request_for(:tomorrow, :in)
  tt.request_for(:tomorrow, :out)
end

#end

#scheduler.join