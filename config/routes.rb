Rails.application.routes.draw do
  root 'users#show'
  devise_for :users
  resources :users, only: [:new, :show, :update]
  resources :apps, only: [:new, :create, :edit, :update]
  get 'orders/new'
  resources :payments, only: [:new]
  post 'payments/create', to: "payments#create"
end
