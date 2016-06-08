Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items, only: [:index]

  resources :users, only: [:new, :index, :create]

  get "/dashboard" => "users#show", as: "user"
  get "/:id" => "categories#show", as: "category"


end
