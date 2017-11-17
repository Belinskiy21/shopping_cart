ShoppingCart::Engine.routes.draw do
  root 'carts#show'
  devise_for :users, class_name: "User", module: :devise
  resource :cart, only: [:show, :update]
  resources :checkout
  resources :order_items, only: [:create, :update, :destroy]

end
