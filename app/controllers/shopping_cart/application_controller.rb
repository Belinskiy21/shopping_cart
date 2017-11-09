module ShoppingCart
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_order

    def current_order
      if session[:order_id].nil?
        Order.new
      else
        Order.where(id: session[:order_id]).last || Order.new
      end
    end
  end
end
