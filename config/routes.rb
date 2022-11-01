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

  # define calendar with token
  # get 'calendars/:id(/:token)', to: 'calendars#show', as: 'show_calendar'
  # get 'calendars/:id/:token/sign_up', to: 'calendars#sign_up'
  # post 'calendars/:id(/:token)', to: 'calendars#create'
  # get 'calendars/new', to: 'calendars#new', as: 'new_calendar'
  # put 'calendars/:id(/:token)', to: 'calendar#update'
  # patch 'calendars/:id(/:token)', to: 'calendar#update'
  # get 'calendars/:id(/:token)/edit', to: 'calendar#edit', as: 'edit_calendar'
  # get '/calendars', to: 'calendar#index', as: 'calendars'
  # post   '/calendars', to: 'calendars#create'
  # delete '/calendars/:id(/:token)', to: 'calendars#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :calendars, param: :invite_token do
    resources :user_calendars, only: %i[new create]
  end
  # Defines the root path route ("/")
  root 'application#hello'
end
