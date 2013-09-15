require 'factory_girl'

5.times do
  post = FactoryGirl.create(:blog_post)
  rand(2).times do
    post.comments.create( content: FactoryGirl.build(:comment).content )
  end  
end