Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # Routes for projects
  get '/users-projects' => 'projects#user_index'
  get '/projects' => 'projects#index'
  post '/projects' => 'projects#create'
  get '/projects/:id' => 'projects#show'
  patch '/projects/:id' => 'projects#update'
  delete '/projects/:id' => 'projects#delete'
  # Routes for User
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'
  # Routes for Skills
  get '/skills' => 'skills#index'
  get '/skills/:id' => 'skills#show'
  # Routes for ProjectUsers
  get '/project-users' => 'project_users#index'
  post '/project-users' => 'project_users#create'
end
