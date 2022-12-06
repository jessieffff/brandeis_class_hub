Rails.application.routes.draw do
  get "home/calendar"

  resources :other_events, only: [:create, :new]
  resources :holidays, only: [:create, :new]
  resources :class_periods, only: [:create, :new]
  resources :assignments, only: [:create, :new]
  resources :users, except: [:index, :destroy]
  resources :user_calendars, except: [:show, :update]do
    collection { post :subscribe_calendar }
  end
  resources :courses do
    collection { post :import_from_excel }
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :calendars, param: :invite_token do
    resources :user_calendars, only: %i[new create]
    resources :holidays, param: :slug, except: [:index]
    resources :other_events, param: :slug, except: [:index]
    resources :courses, param: :slug, except: [:index] do 
      resources :assignments, param: :slug, except: [:index]
      resources :class_periods, except: [:index]
    end
  end

  
  # Defines the root path route ("/")
  root 'static_pages#home'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get 'search', to: "calendars#search"
  get 'subscribe', to: 'static_pages#subscribe'


  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
end
