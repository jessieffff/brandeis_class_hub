Rails.application.routes.draw do

  resources :companies do
    collection { post :import }
  end

  get "home/calendar"
  resources :other_events
  resources :holidays
  resources :class_periods
  resources :user_calendars
  resources :courses do
    collection { post :import }
  end
  resources :assignments
  resources :users
  resources :events


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :calendars, param: :invite_token do
    resources :user_calendars, only: %i[new create]
  end
  # Defines the root path route ("/")
  root 'static_pages#home'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
