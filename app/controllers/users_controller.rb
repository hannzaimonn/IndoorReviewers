class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :show,:edit]
  before_action :baria_user, only: [:edit, :update]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user)
  	else
      @users = User.all
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :image)
  end

  #url直接防止
  def baria_user
   unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
   end
end
