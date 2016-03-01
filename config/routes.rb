Rails.application.routes.draw do
  resources :items, only: [:index]

  resources :cart_items, only: [:create, :index]
  get "/:category", to: "categories#show", as: "category"
end
