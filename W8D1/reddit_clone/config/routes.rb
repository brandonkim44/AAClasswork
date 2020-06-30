Rails.application.routes.draw do

  resources :users, only: [:new, :show, :create, :destroy] do
    resources :posts, only: [:update, :edit]
  end
  
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index, :edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
