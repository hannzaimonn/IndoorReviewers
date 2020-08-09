class CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
  	@comment = @review.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end


  def destroy
    @comment = Comment.find(params[:id])
  	@comment.destroy
    render :index
  end

private
  def comment_params
    params.require(:comment).permit(:body, :review_id, :user_id)
  end

end
