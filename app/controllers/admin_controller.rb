class AdminController < ApplicationController
  def index
    logout
    @users = User.all
  end

  def new
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end
end