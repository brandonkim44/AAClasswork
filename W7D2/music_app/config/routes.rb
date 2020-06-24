Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]
  # resources :bands
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  resources :bands do
    resource :albums, only: :new
  end
end
