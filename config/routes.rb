Rails.application.routes.draw do
  get "home/calendar"

  resources :other_events, except: [:index]
  resources :holidays, only: [:create, :new]
  resources :class_periods, except: [:index]
  # resources :user_calendars 
  resources :user_calendars  do
    collection { post :subscribe_calendar }
  end
  # resources :courses
  resources :courses do
    collection { post :import_from_excel }
  end
  resources :assignments
  resources :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :calendars, param: :invite_token do
    resources :user_calendars, only: %i[new create]
    resources :holidays, param: :slug
  end
  
  # Defines the root path route ("/")
  root 'static_pages#home'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get 'search', to: "calendars#search"
  get 'subscribe', to: 'static_pages#subscribe'
end
