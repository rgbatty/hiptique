Rails.application.routes.draw do
  root :to => "items#index"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :index, :create, :show]
  resources :user_carts, only: [:create, :index]

  get "/cart" => "user_carts#index", as: "cart"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/dashboard" => "users#show", as: "user"
  get "/:id" => "categories#show", as: "category"


end
