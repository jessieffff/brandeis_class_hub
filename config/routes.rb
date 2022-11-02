Rails.application.routes.draw do
  resources :other_events
  resources :holidays
  resources :class_periods
  # resources :calendars
  # resources :user_calendars
  resources :courses
  resources :assignments
  resources :users
  resources :events


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :calendars, param: :invite_token do
    resources :user_calendars, only: %i[new create]
  end
  # Defines the root path route ("/")
  root 'static_pages#home'
end
