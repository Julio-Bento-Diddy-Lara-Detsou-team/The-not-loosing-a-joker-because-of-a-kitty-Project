Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources 'items'
  resources 'carts'
  get 'delete/item/:id', to: 'carts#remove_item', as: 'remove_item'
end
