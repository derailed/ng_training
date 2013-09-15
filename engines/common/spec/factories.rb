require 'ffaker'

FactoryGirl.define do  
  factory :comment, class: Common::Comment do |c|
    c.content { Faker::Lorem.paragraph }
  end
end