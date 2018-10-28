class CommentsController < ApplicationController
  def create
     comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿'
      redirect_to comment.board

    else
      #本当は下記を書きたかった
#      redirect_back, flash: {
#        comment: comment,
#        error_messages: comment.errors.full_messages
#     }
      #一時的に
      redirect_back(fallback_location: @board)
      flash[:notice] = 'コメントの投稿に失敗'
  def destroy
  end
      }
  private
  
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
