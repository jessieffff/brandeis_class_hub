Rails.application.routes.draw do
  get "home/calendar"
  resources :other_events
  resources :holidays
  resources :class_periods
  resources :user_calendars
  resources :courses
  resources :assignments
  resources :users
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'application#hello'
end
