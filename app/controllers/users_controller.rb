class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_back(fallback_location: root_path)
      flash[:success] = "Your email preferences are saved!"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Oops there was an error when updating your preferences. Try again!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
  end
end
