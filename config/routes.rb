Rails.application.routes.draw do
  resources :items, only: [:index]

  resources :cart_items, only: [:create, :index]

  get "/", to: "users#index"
  resources :users, only: [:create, :new]
  get "/dashboard", to: "users#show", as: "dashboard"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/:category", to: "categories#show", as: "category"
end
