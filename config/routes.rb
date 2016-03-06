Rails.application.routes.draw do
  resources :items, only: [:index, :show]

  resources :cart_items, only: [:create, :destroy]
  root to: "homes#show"
  get "/cart", to: "cart_items#index"

  resources :users, only: [:create, :new, :show]

  resources :orders, only: [:index, :create, :show]
  get "/dashboard", to: "users#show", as: "dashboard"

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/:category", to: "categories#show", as: "category"
end
