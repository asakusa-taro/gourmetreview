Rails.application.routes.draw do
  get 'shop_images/index'
  get 'shop_images/create'
  get 'shop_images/destroy'
  get 'reviews/create'
  get 'reviews/destroy'
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
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  
  resources :shops do
    member do
      resources :shop_images
    end
    resources :reviews

  end
  
  resources :favorites, only: [:create, :destroy]

end
