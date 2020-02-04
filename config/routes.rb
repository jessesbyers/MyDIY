Rails.application.routes.draw do

  root to: "users#index"

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  # post '/logout' => 'sessions#destroy'

  # get '/projects/new' => 'projects#new'
  # post '/projects' => 'projects#create'

  resources :projects

  resources :goals



end
