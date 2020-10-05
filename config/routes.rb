Rails.application.routes.draw do
  # Routes for All Products
  get "/products", to: "products#index", as: "products"
end
