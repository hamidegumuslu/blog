class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[notice] = "Thanks for the comment"
      redirect_to post_path(@comment.post_id)
    else
      flash[:alert] = 'Comment olusturulurken hata oldu'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
