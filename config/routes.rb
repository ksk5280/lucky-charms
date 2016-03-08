Rails.application.routes.draw do
  resources :items, only: [:index, :show, :new, :create]

  resources :cart_items, only: [:create, :destroy]
  root to: "homes#show"
  get "/cart", to: "cart_items#index"

  resources :users, only: [:create, :new, :edit, :update, :show]
  resources :orders, only: [:index, :create, :show, :update]

  get "/dashboard", to: "users#show", as: "dashboard"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :orders, only: [:show]
    get "/:status", to: "orders#index", as: "status"
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :categories, only: [:index]
  get "/:category", to: "categories#show", as: "category"
end
