require 'spec_helper'

describe CommentsController do  
  context "when editing" do
    let(:blog_post) { create :blog_post }
  
    it "adds a comment to a blog post correctly" do
      expect {
        post :create, comment: { 
          commentable_type: BlogPost, 
          commentable_id:   blog_post.id, 
          content:          "Testing, Yo!" 
        }
      }.to change { Comment.count }
  
      expect(response).to redirect_to blog_posts_path    
    end
  
    it 'does not allow invalid comments' do
      post :create, comment: { 
        commentable_type: BlogPost, 
        commentable_id:   blog_post.id, 
        content:          nil 
      }
      
      expect(response).to render_template :new
      expect(assigns(:comment).errors.messages).to have(1).item
    end
  end
end