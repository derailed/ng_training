require 'spec_helper'

describe BlogPostsController do
  context "when viewing" do
    it 'list all blog posts correctly' do
      get :index
    
      expect(response).to            render_template :index
      expect(assigns :blog_posts).to eq BlogPost.sort_recent
    end
  end
  
  context "when creating" do  
    it 'creates a new blog post correctly' do
      get :new
    
      expect(response).to               render_template :new
      expect(assigns :blog_post).to_not be_nil
    end

    it "save a brand new blog post correctly" do
      expect {
        post :create, blog_post: { title: "Test me", content: "Test" }
      }.to change { BlogPost.count}
      res = assigns(:blog_post)
          
      expect(response).to    redirect_to blog_posts_path
      expect(res.title).to   eq "Test me"
      expect(res.content).to eq "Test"
    end  
  end
  
  context "when editing" do
    let(:blog_post) { create :blog_post }
    
    it "edits a blog post correctly" do
      get :edit, id: blog_post.id
    
      expect(response).to            render_template :edit
      expect(assigns(:blog_post)).to eq blog_post
    end

    it 'updates a blog post correctly' do
      patch :update, id: blog_post.id, blog_post: { title: 'Fred', content: 'Test' }
    
      expect(response).to            redirect_to blog_posts_path
      expect(assigns(:blog_post)).to eq blog_post
    end
  end

  context "when destroying" do
    it 'deletes a blog post correctly' do
      expect {
        delete :destroy, id: BlogPost.first
      }.to change { BlogPost.count }
    end
  end
end