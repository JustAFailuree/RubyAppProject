Rails.application.routes.draw do
  resources :categories
  resources :ingredients
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  post '/register', to: 'users#register'
  get '/register', to: 'users#register'

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#login'

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  post '/dashboard', to: 'users#dashboard'

  delete '/logout', to: 'users#destroy', as: :logout







  # Defines the root path route ("/")
   root "users#login"
end
