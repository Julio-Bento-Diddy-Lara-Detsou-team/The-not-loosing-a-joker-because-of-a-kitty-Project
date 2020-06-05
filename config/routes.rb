Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources 'items'
  resources 'carts', only: [:show]
  resources 'shopping_sessions', only: [:new, :destroy]
  resources 'teams', only: [:index]
  resources 'orders', only: [:create, :index]
  resources 'users', only: [:show, :edit, :update]
end
