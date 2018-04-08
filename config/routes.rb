Rails.application.routes.draw do
  get 'projects/' => 'projects#index'
  post 'projects' => 'projects#create'
  get 'projects/:id' => 'projects#show'
  patch 'projects/:id' => 'projects#update'
  delete 'projects/:id' => 'projects#delete'
end
