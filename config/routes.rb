Rails.application.routes.draw do
  # Routes for All Products
  get "/products", to: "products#index", as: "products"

  # Routes for Individual Product
  get "/products/:id", to: "products#show", as: "product"
end
