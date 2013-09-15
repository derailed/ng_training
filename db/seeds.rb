require 'ffaker'
require 'factory_girl'

FactoryGirl.definition_file_paths = [File.expand_path( "spec/factories", Rails.root ), 
                                     File.expand_path( "spec/factories", Common::Engine.root )]
FactoryGirl.find_definitions 

BlogPost.delete_all

10.times do |i|
  post = FactoryGirl.create(:blog_post)
  rand(5).times do
    post.comments.create( content: FactoryGirl.build(:comment).content )
  end
  post.created_at = Time.now - (rand(i+100)* 60*60*i)
  post.save  
end