class BookmarksController < ApplicationController
	def create
		review = Review.find(params[:review_id])
		bookmark = current_user.bookmarks.new(review_id: review.id)
		bookmark.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		review = Review.find(params[:review_id])
		bookmark = current_user.bookmarks.find_by(review_id: review.id)
		bookmark.destroy
		redirect_back(fallback_location: root_path)
	end
end
