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

  resources :collaborations

# add nested route for project/:id/goals to show all photos/updates/etc
# only use for index, create, and new if something has_many
end
