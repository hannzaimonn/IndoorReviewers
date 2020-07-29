class GenreController < ApplicationController
	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.new
		@genre.save
	end
end
