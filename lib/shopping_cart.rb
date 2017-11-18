require "shopping_cart/engine"
require 'devise'
require 'cancancan'
require 'pry'
module ShoppingCart
  mattr_accessor :product_class
  mattr_accessor :user_class

  def self.product_class
    @@product_class.constantize
  end

  def self.user_class
    @@user_class.constantize
  end

end
