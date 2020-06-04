Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources 'items'
  resources 'carts'
  resources 'shopping_sessions', only: [:new, :destroy]
  resources 'orders'
  resources 'order_items'
end
