class SearchsController < ApplicationController
	def search
		search = params[:search]
		word = params[:word]

		@review = Review.search(search,word)
	end
end
