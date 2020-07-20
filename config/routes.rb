Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :shops
  resources :shop_comments
  resources :hair_products
  resources :hair_product_comments

  post "/login", to: "users#login"
  post "/signup", to: "users#signup"
  get "/validate", to: "users#validate"
  post "/shopsearch", to: "shops#search"

end


