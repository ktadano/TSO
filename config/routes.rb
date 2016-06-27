Rails.application.routes.draw do
  root 'home#index'
  get 'signup' => 'users#new'

  resources :users, only: [:new, :create, :show]
end
