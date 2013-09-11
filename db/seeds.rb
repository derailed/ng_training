require 'factory_girl'

FactoryGirl.definition_file_paths = [File.expand_path( "spec/factories", Rails.root )]
# FactoryGirl.find_definitions 

BlogPost.delete_all

5.times do |i|
  post = FactoryGirl.create(:blog_post)
  rand(5).times do
    post.comments << FactoryGirl.create(:comment)
  end
  post.created_at = Time.now - (rand(i+100)* 60*60*i)
  post.save  
end