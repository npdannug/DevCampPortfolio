class BlogChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blog_channel_#{params[:blog_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
