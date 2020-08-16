class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit]
    before_action :correct_user,   only: [:edit, :update]

	def new
		@review = Review.new
		@genre = Genre.new
		@genres = Genre.all
	end

	def index
		@q = Review.ransack(params[:q])
		@genres = Genre.all
		@reviews = @q.result(distinct: true).order(created_at: :desc)
	end

	def show
		@review = Review.find(params[:id])
		@comment = Comment.new
		@comments = @review.comments.order(created_at: :desc)
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

	def correct_user
		@review = Review.find(params[:id])
        redirect_to user_path(current_user) unless @review.user == current_user
    end
end
