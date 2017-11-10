ShoppingCart::Engine.routes.draw do
  root 'carts#show'

  resource :cart, only: [:show, :update]
end
