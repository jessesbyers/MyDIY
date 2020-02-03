Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#index'
  # resources :users
  root to: "users#index"

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
end
