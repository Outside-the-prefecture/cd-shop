Rails.application.routes.draw do
  get 'contacts/new' => "contacts#new"
  post 'contacts/create' => "contacts#create"

  get "admin/contacts/index" => "admin/contacts#index"
  get "admin/contacts/show/:id" => "admin/contacts#show",as: "admin_contacts_show"

  get 'arrivals/create'
  root "products#index"

  # get "admin/managers/sign_in"=>"admins/sessions#new"
  # post "admin/managers/sign_in"=>"admins/sessions#create"
  # delete "admin/managers/sign_out"=> "admins/sessions#destroy"
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :passwords => "users/passwords",
    :registrations => "users/registrations"
  }

  devise_for :admins, :controllers => {
    :sessions => "admins/sessions"
  }

  get "users/:user_id/orders/finish" => "orders#finish", as: "orders_finish"
  get "search" => "users#search"
  resources :products,only: [:show] do
    resource :favorites,only: [:create,:destroy]
    resources :reviews,only: [:index,:create,:edit,:update,:destroy]
  end
  resources :users,only: [:show,:edit,:update] do
    resources :favorites,only: [:index]
  	resources :cart_items,only: [:index ,:create ,:update, :destroy]
  	resources :histories,only: [:show]
  	resources :orders,only: [:new,:create]
  end

  delete 'users/:id', to: 'users#destroy'

  namespace :admin do
  	resources :managers,only: [:index,:show,:edit,:update,:destroy]

    resources :contacts,only: [:index,:show]

  	resources :manager_products do
      resources :arrivals,only: [:create]
    end
  	resources :manager_orders,only: [:index,:show,:update]
  	resources :artists,only: [:create,:show]
  	resources :genres,only: [:create,:show]
  	resources :labels,only: [:create]
  end
  patch 'users/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
