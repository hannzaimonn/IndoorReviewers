class GenresController < ApplicationController
	def new
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
		if @genre.save
           redirect_to new_genre_path
       else
       	render :new
       end
	end

	private
  def genre_params
  	params.require(:genre).permit(:name)
  end
end
