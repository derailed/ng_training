$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "social"
  s.version     = Social::VERSION
  s.authors     = ["Fernand"]
  s.email       = ["fernand.galiana@gmail.com"]
  s.homepage    = "http://tehbrog"
  s.summary     = "Social engine"
  s.description = "Social engine"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails'                  , '~> 4.0.0'
  s.add_dependency 'haml'                   , '~> 4.0.3'
  s.add_dependency 'sass-rails'             , '~> 4.0.0'
  s.add_dependency 'bootstrap-sass'         , '~> 2.3.2.2'
  s.add_dependency 'font-awesome-sass-rails', '~> 3.0.2.2'
  
  s.add_development_dependency "mysql2"            , '~> 0.3.13'
  s.add_development_dependency "shoulda-matchers"  , '~> 2.2.0'  
  s.add_development_dependency 'ffaker'            , '~> 1.18.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.1'
  s.add_development_dependency 'rspec-rails'       , '~> 2.14.0'
  s.add_development_dependency 'database_cleaner'  , '~> 1.1.1'
  s.add_development_dependency 'coffee-rails'      , '~> 4.0.0'
  s.add_development_dependency 'fuubar'            , '~> 1.2.1'
  
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-zeus'
  s.add_development_dependency 'guard-bundler'  
end