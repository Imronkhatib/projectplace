Rails.application.routes.draw do
  # CRUD actions for Projects
  get '/projects' => 'projects#index'
  post '/projects' => 'projects#create'
  get '/projects/:id' => 'projects#show'
  patch '/projects/:id' => 'projects#update'
  delete '/projects/:id' => 'projects#delete'
  # CRUD actions for User
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'
end
