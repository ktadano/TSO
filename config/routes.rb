Rails.application.routes.draw do
  root 'home#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'product_resistration' => 'products#new'
  resources :users, only: [:show, :create]
  resources :products, only: [:show, :create]
  resources :bids, only: [:create]
end
