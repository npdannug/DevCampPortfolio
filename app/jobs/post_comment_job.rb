class PostCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    html = ApplicationController.render(
				partial:'comments/comment', 
				locals: {
				  comment: comment
			})
	ActionCable.server.broadcast "blog_channel_#{comment.blog_id}", html: html
  end
end
