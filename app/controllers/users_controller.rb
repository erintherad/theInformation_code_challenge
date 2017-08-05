class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
  end
end
