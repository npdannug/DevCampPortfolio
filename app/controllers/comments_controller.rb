class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params) 
		@comment.user = current_user		
		if @comment.save
			PostCommentJob.perform_later(@comment)
			
		end
	end

	private
	def comment_params
  	  params.require(:comment).permit(:context, :user_id, :blog_id)
  	end
end
