class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @cafetype = Cafetype.find(params[:cafetype_id])
    if @comment.save
      CommentChannel.broadcast_to @cafetype, {comment: @comment, user: @comment.user}
    else
      render "cafetypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cafetype_id: params[:cafetype_id])
  end
end
