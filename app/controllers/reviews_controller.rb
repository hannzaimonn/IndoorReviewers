class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@genre = Genre.new
		@genres = Genre.all
	end

	def index
		@reviews = Review.all
		@genres = Genre.all
	end

	def show
		@review = Review.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@review = Review.find(params[:id])
		@genres = Genre.all
	end

	def rank
		@all_ranks =Review.find(Bookmark.group(:review_id).order('count(review_id) desc').limit(50).pluck(:review_id))
	end

	def create
		@review = Review.new(review_params)
		@genres = Genre.all
		@review.user_id = current_user.id
		@review.release = false

		if @review.save
			redirect_to review_path(@review)
		else
			@user = current_user
			@genres = Genre.all
			render :'new'
		end
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to review_path(@review)
		else
			render :edit
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to user_path(current_user)
	end

	private

	def review_params
		params.require(:review).permit(
			:user_id, :title, :body, :genre_id, :image, :release,
			genres:[:name])
	end
end
