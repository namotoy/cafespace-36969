class CommentChannel < ApplicationCable::Channel
  def subscribed
    @cafetype = Cafetype.find(params[:cafetype_id])
    stream_for @cafetype
    # stream_from "comment_channel"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
