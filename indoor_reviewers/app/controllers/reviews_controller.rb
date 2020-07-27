class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.release = false
		        if params[:_add] == "genresAdds"
		        	@genres = Genre.all
		        else params[:_add] == "newAdd"
		        	@genre = Genre.new
		        	@genre.name = params[:genres][:name]
		        	@genre.save

		        	@review.genre = params[:genres][:id]
		        end


		if @review.save
			redirect_to reviews_path
		else
			@user = current_user
			render :'users/show'
		end
	end

	private

	def review_parms
		params.require(:review).permit(
			:user_id, :title, :body, :genre_id, :image, :release)
	end
end
