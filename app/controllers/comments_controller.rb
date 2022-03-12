class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @cafetype = Cafetype.find(params[:cafetype_id])
    if @comment.save
      CommentChannel.broadcast_to @cafetype, {comment: @comment, user: @comment.user}
      # ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user}
      # redirect_to cafetype_path(params[:cafetype_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cafetype_id: params[:cafetype_id])
  end
end
