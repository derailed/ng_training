module Social
  class CommentsController < ApplicationController    
    def new
      @comment = Comment.new
    end
    
    def create
      @comment = Comment.new(comment_params)

      respond_to do |format|
        if @comment.save
          format.html { redirect_to main_app.polymorphic_url(@comment.commentable.class),
                        notice: 'Comment was successfully created.'
                      }
          format.json { render action: 'show', status: :created, location: @comment }
        else
          format.html { render action: 'new' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    
    def comment_params
      params.require(:comment).permit(:content, :commentable_type, :commentable_id)
    end
  end
end

