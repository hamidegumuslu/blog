class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[notice] = "Thanks for the comment"
      redirect_to post_path(@comment.post_id)
    else
      Rails.logger.debug(@comment.errors.inspect)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
