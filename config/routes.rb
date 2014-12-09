Rails.application.routes.draw do
  root 'timetable#index'
  get 'yesterday' => 'timetable#index', defaults: {when_it: 'yesterday'}
end
