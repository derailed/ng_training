$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "common/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "common"
  s.version     = Common::VERSION
  s.authors     = ["Fernand"]
  s.email       = ["fernand.galiana@gmail.com"]
  s.homepage    = "http://tehbrog"
  s.summary     = "Shared models"
  s.description = "Shared models"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails'                  , '~> 4.0.0'
    
  s.add_development_dependency "mysql2"            , '~> 0.3.13'
  s.add_development_dependency "shoulda-matchers"  , '~> 2.2.0'  
  s.add_development_dependency 'ffaker'            , '~> 1.18.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.1'
  s.add_development_dependency 'rspec-rails'       , '~> 2.14.0'
  s.add_development_dependency 'database_cleaner'  , '~> 1.1.1'
  s.add_development_dependency 'fuubar'            , '~> 1.2.1'
  
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-zeus'
  s.add_development_dependency 'guard-bundler'  
end