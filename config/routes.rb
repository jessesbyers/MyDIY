Rails.application.routes.draw do

  root to: "projects#index"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :collaborations
  resources :projects
  resources :goals  

  resources :goals, only: [:show] do
    resources :resources, only: [:new, :create, :index]
    resources :images, only: [:new, :create, :index]
    resources :updates, only: [:new, :create, :index]
  end

  resources :images
  resources :resources
  resources :updates




end
