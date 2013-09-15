# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'shoulda-matchers'
require 'database_cleaner'

require 'bundler'
Bundler.require

if ENV["COV"]
  SimpleCov.start 
end

FactoryGirl.definition_file_paths = [File.expand_path( "spec/factories", Social::Engine.root )]
FactoryGirl.find_definitions 

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Dummy::Application.routes.url_helpers  
  
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
    
  config.mock_with :rspec
    
  config.include FactoryGirl::Syntax::Methods
    
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  
  config.treat_symbols_as_metadata_keys_with_true_values = true  
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
    
  config.before :suite do    
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    load "#{Social::Engine.root}/db/test_seeds.rb"
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end