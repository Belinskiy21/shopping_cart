ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_bot_rails'
require 'capybara/rspec'
require 'capybara-webkit'
require 'capybara/webkit/matchers'
require 'transactional_capybara/rspec'
require 'database_cleaner'
require 'ffaker'
require 'aasm/rspec'
Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 5

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: %w(ar_internal_metadata))
    DatabaseCleaner.strategy = :transaction
  end


  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
