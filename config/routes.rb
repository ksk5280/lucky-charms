Rails.application.routes.draw do
  resources :items, only: [:index, :show]

  resources :cart_items, only: [:create, :destroy]
  get "/cart", to: "cart_items#index"
  get "/:category", to: "categories#show", as: "category"
end
