class HomesController < ApplicationController
  def top
  	@genre = Genre.all
  	@review = Review.page(params[:page]).per(3).reverse_order
  end

  def about
  end
end
