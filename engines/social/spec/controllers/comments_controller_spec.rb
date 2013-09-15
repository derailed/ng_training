require 'spec_helper'

describe Social::CommentsController do  
  context "when editing" do
    let(:blog_post) { create :blog_post }
  
    it "adds a comment to a blog post correctly" do
      expect {
        post :create, comment: { 
          commentable_type: BlogPost, 
          commentable_id:   blog_post.id, 
          content:          "Testing, Yo!"
        }, use_route: :social
      }.to change { Common::Comment.count }
  
      expect(response).to redirect_to polymorphic_path(BlogPost)
    end
  
    it 'does not allow invalid comments' do
      post :create, comment: { 
        commentable_type: BlogPost,
        commentable_id:   blog_post.id,
        content:          nil
      }, use_route: :social
      
      expect(response).to render_template :new
      expect(assigns(:comment).errors.messages).to have(1).item
    end
  end
end