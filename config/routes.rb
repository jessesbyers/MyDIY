Rails.application.routes.draw do

  root to: "users#index"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :projects

  resources :goals

  resources :collaborations




  # get '/projects/new' => 'projects#new'
  # post '/projects' => 'projects#create'
    # post '/logout' => 'sessions#destroy'




# add nested route for project/:id/goals to show all photos/updates/etc
# only use for index, create, and new if something has_many
end
