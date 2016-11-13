Rails.application.routes.draw do
  root 'users#show'
  devise_for :users
  resources :users, only: [:new, :show, :update]
  resources :apps, only: [:new, :create]
  get 'orders/new'
  resources :payments, only: [:new, :create]
end
