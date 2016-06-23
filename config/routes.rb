Rails.application.routes.draw do
  root 'home#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :users, only: [:new, :show, :create]
end
