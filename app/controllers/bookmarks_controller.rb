class BookmarksController < ApplicationController
	before_action :set_variables

	def like
		bookmark = current_user.bookmarks.new(review_id: @review.id)
		bookmark.save
	end

	def unlike
		bookmark = current_user.bookmarks.find_by(review_id: @review.id)
		bookmark.destroy
	end

	private

  def set_variables
    @review = Review.find(params[:review_id])
    @id_name = "#bookmark-link-#{@review.id}"
  end
end
