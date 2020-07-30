class SearchsController < ApplicationController
	def search
		@range = params[:range]
		search = params[:search]
		word = params[:word]

		if @renge == '1'
			@review = Review.search(search,word)
		else
			@genre = Genre.search(search,word)
		end
	end
end
