Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # Showing the id
  get 'users', to: 'users#index', as: 'users'  #ask TA later about when it'd be useful to have alias for a route
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users/', to: 'users#create', as: 'create_user'
  patch 'users/:id', to: 'users#update', as: 'update_user' #preferred
  put 'users/:id', to: 'users#update', as: 'put_user' 
  delete 'users/:id', to: 'users#destroy', as: 'delete_user'
end
