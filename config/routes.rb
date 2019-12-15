Rails.application.routes.draw do
  root "products#index"
  devise_for :users

  get "users/:user_id/orders/finish" => "orders#finish"
  get "search" => "users#search"
  resources :products,only: [:show]
  resources :users,only: [:show,:edit,:update] do
  	resources :cart_items,only: [:index ,:create , :destroy]
  	resources :histories,only: [:show]
  	resources :orders,only: [:new,:create]
  end




  delete 'users/:id', to: 'users#destroy'

  namespace :admin do
  	resources :managers,only: [:index,:show,:edit,:update,:destroy]
  	resources :manager_products
  	resources :manager_orders,only: [:index,:show]
  	resources :artists,only: [:create]
  	resources :genres,only: [:create]
  	resources :labels,only: [:create]
  end
  patch 'users/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
