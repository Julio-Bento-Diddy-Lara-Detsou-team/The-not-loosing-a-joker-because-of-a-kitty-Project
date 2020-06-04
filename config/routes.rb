Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources 'items'
  resources 'carts', only: [:show]
  resources 'shopping_sessions', only: [:new, :destroy]
  resources 'orders', only: [:create]
end
