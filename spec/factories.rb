require 'ffaker'

FactoryGirl.define do  
  factory :blog_post, class: BlogPost do |post|
    post.title   { Faker::Lorem.sentence }
    post.content { Faker::Lorem.paragraph }
  end
  
  factory :comment, class: Comment do |c|
    c.content { Faker::Lorem.paragraph }
  end
end