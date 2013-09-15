require 'factory_girl'

5.times do
  FactoryGirl.build(:comment)
end