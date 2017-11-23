module ShoppingCart
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_order

    def current_order
      if session[:order_id].nil?
        ShoppingCart::Order.new
      else
        ShoppingCart::Order.where(id: session[:order_id]).last || ShoppingCart::Order.new
      end
    end
  end
end
