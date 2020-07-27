class CommentsController < ApplicationController

    def new
      @comments = Comment.all
      @comment = Comment.new
    end

	def create
	  @comment = current_user.comments.build(comment_params) 
	  @comment.user = current_user		
	  @comment.save
	  
    end

    

	private
	def comment_params
  	  params.require(:comment).permit(:context, :user_id, :blog_id)
  	end
end
