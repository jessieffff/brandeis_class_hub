Rails.application.routes.draw do
  get 'home/calendar'
  resources :other_events
  resources :holidays
  resources :class_periods
  resources :user_calendars
  resources :courses
  resources :assignments
  resources :users
  resources :events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :calendars, param: :invite_token do
    resources :user_calendars, only: %i[new create]
    resource :invite_link, only: :show
  end
  # Defines the root path route ("/")
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
