Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'shops/new'
  get 'shops/show'
  get 'shops/create'
  get 'shops/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :likes #確認する
    end
  end
  
  resources :shops
  resources :favorites, only: [:create, :destroy]

end
