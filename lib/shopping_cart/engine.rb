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
    require 'sass-rails'
    isolate_namespace ShoppingCart

    config.generators do |g|
     g.test_framework :rspec
     g.fixture_replacement :factory_girl, dir: 'spec/factories'
     g.stylesheets false
     g.javascripts false
     g.template_engine :haml
   end
  end
end
