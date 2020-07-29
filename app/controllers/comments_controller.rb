class CommentsController < ApplicationController
	def create
		review = Review.find(params[:review_id])
		comment = current_user.comments.new(comment_params)
		comment.review_id = review.id
		if comment.save
			redirect_to review_path(review)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		Comment.find_by(id: params[:id], review_id: params[:review_id]).destroy
		redirect_to review_path(params[:review_id])
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
