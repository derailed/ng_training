require 'spec_helper'

describe CommentsController do
  
  it "adds a comment to a blog post correctly" do
    blog_post = create(:blog_post)
    expect {
      post :create, comment: { blog_post_id: blog_post.id, content: "Testing, Yo!" }
    }.to change { Comment.count }
  
    response.should redirect_to blog_posts_path    
  end
end