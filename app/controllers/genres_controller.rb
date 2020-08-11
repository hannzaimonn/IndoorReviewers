class GenresController < ApplicationController
	def new
		@genre = Genre.new
		@genres = Genre.all
	end

	def index
		@genre = Genre.find(params[:id]).order(created_at: :desce)
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.user_id = current_user.id
		@genres = Genre.all
		if @genre.save
           redirect_to new_genre_path
       else
       	render :new
       end
	end

	def destroy
		@genre = Genre.find(params[:id])
		@genre.destroy
		redirect_to new_genre_path
	end

	private
  def genre_params
  	params.require(:genre).permit(:name, :user_id)
  end
end
