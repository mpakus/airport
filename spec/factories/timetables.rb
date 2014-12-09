FactoryGirl.define do
  factory :timetable do
    when_it   "today"
    direction "in"
    schedule  "{json: 'here'}"
  end

end
