Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'home/private'
  resources 'items'
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
