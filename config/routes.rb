Rails.application.routes.draw do
  get 'shops/new'
  get 'shops/show'
  get 'shops/create'
  get 'shops/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :shops
    
end
