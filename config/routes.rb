Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:create, :destroy]
  root to: "homes#show"
  get "/cart", to: "cart_items#index"
  get "/:category", to: "categories#show", as: "category"
end
