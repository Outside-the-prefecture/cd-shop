Rails.application.routes.draw do
  get 'arrivals/create'
  root "products#index"
  # get "admin/managers/sign_in"=>"admins/sessions#new"
  # post "admin/managers/sign_in"=>"admins/sessions#create"
  # delete "admin/managers/sign_out"=> "admins/sessions#destroy"
  devise_for :users
  devise_for :admins, :controllers => {
    :sessions => "admins/sessions"
  }

  get "users/:user_id/orders/finish" => "orders#finish", as: "orders_finish"
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
  	resources :manager_products do
      resources :arrivals,only: [:create]
    end
  	resources :manager_orders,only: [:index,:show]
  	resources :artists,only: [:create]
  	resources :genres,only: [:create]
  	resources :labels,only: [:create]
  end
  patch 'users/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
