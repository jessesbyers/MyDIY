Rails.application.routes.draw do

  root to: "users#index"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :collaborations
  resources :projects

  resources :goals, only: [:show] do
    resources :resources, only: [:new, :create]
    resources :images, only: [:index]
    resources :updates, only: [:index]
  end

  resources :goals

end
