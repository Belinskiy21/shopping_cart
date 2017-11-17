module ShoppingCart
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'country_select'
    require 'wicked'
    require 'virtus'
    require 'devise'
    require 'haml'
    require 'rails-i18n'
    require 'aasm'
    require 'cancancan'
    require 'pry'
    isolate_namespace ShoppingCart
  end
end
