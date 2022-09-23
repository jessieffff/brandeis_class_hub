Rails.application.routes.draw do
  resources :courses
  resources :assignments
  resources :users
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'application#hello'
end
