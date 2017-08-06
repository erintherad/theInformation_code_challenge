class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @nonce = params[:token]
    email = params[:email]
    token = Token.find_by(:nonce => @nonce)
    @user = token.user
    if @user.email == email
      @user
    else
      render :invalid
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update_attributes(user_params)
      flash[:success] = "Your email preferences are saved!"
      render :show
    else
      flash[:alert] = "Oops there was an error when updating your preferences. Try again!"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :marketing, :articles, :digest)
  end
end
