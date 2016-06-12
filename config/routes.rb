Rails.application.routes.draw do
  root :to => "items#index"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :index, :create]
  resources :cart_items, only: [:create, :index, :destroy, :update]

  resources :orders, only: [:index]

<<<<<<< HEAD
  get "/cart" => "cart_items#index", as: "cart"
=======
  namespace :admin do
    get "/dashboard" => "users#show"

  end

  get "/cart" => "user_carts#index", as: "cart"
>>>>>>> dev

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/dashboard" => "users#show", as: "user"
  get "/:id" => "categories#show", as: "category"


end
