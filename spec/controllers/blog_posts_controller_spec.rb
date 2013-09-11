require 'spec_helper'

describe BlogPostsController do

  it 'list all blog posts correctly' do
    get :index, use_route: :blogging
    
    response.should render_template :index
    assigns(:blog_posts).should == BlogPost.sort_recent
  end
  
  it 'creates a new blog post correctly' do
    get :new, use_route: :blogging
    
    response.should render_template :new
    assigns(:blog_post).should_not be_nil
  end

  it "save a brand new blog post correctly" do
    expect {
      post :create, blog_post: { title: "Test me", content: "Test" }, use_route: :blogging
    }.to change { BlogPost.count}
    
    response.should redirect_to blog_posts_path
    res = assigns(:blog_post)
    res.title.should   == "Test me"
    res.content.should == "Test"
  end  
  
  describe "editing a blog post" do
    let(:blog_post) { create :blog_post }
    
    it "edits a blog post correctly" do
      get :edit, id: blog_post.id, use_route: :blogging
    
      response.should render_template :edit
      assigns(:blog_post).should == blog_post
    end

    it 'updates a blog post correctly' do
      patch :update, id: blog_post.id, blog_post: { title: 'Fred', content: 'Test' }, use_route: :blogging
    
      response.should redirect_to blog_posts_path
      assigns(:blog_post).should == blog_post
    end
  end

  it 'deletes a blog post correctly' do
    expect {
      delete :destroy, id: BlogPost.first, use_route: :blogging
    }.to change { BlogPost.count }
  end    
end