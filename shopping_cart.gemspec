$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping_cart"
  s.version     = ShoppingCart::VERSION
  s.authors     = ["Oleg"]
  s.email       = ["belinskiy21@gmail.com"]
  s.homepage    = 'https://github.com/Belinskiy21/shopping_cart'
  s.summary     = 'Simple shopping cart.'
  s.description = %q(Shopping cart with a multi-step checkout,
                     easily mounted into Rails application.)
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency 'virtus'
  s.add_dependency 'wicked'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'country_select'
  s.add_dependency 'haml'
  s.add_dependency 'rails-i18n'
  s.add_dependency 'devise'
  s.add_dependency 'aasm'
  s.add_dependency 'pry'
  s.add_dependency 'cancancan'
  s.add_dependency 'sass-rails'

  s.test_files = Dir["spec/`/*"]

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'shoulda-callback-matchers'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'transactional_capybara'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'spring', '~> 2.0', '>= 2.0.1'
  s.add_development_dependency 'spring-commands-rspec'
end
