Rails.application.routes.draw do
  devise_for :manegers
  root "products#index"
  devise_for :users
  get "products/:id" => "products#show"
  get "users/:user_id/orders/finish" => "orders#finish"
  patch 'users/:id', to: 'users#destroy'
  resources :users,only: [:show,:edit,:update] do
  	resources :cart_items,only: [:index,:create]
  	resources :histories,only: [:show]
  	resources :orders,only: [:new,:create]
  end
  namespace :admin do
  	resources :managers,only: [:index,:show,:edit,:update,:destroy]
  	resources :manager_products
  	resources :manager_orders,only: [:index,:show]
  	resources :artists,only: [:create]
  	resources :genres,only: [:create]
  	resources :labels,only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
