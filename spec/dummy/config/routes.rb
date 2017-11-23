Rails.application.routes.draw do
  resources :products
  
  mount ShoppingCart::Engine => "/shopping_cart"
  root to: 'products#index'
end
