class UsersController < ApplicationController
  def index
    @users = User.all
    @tokens = Token.all
  end

  def new
    @user = User.new
  end

  def show
    @nonce = params[:token]
    email = params[:email]
    token = Token.find_by(:nonce => @nonce)
    @user = User.find_by(:email => email)

    if token.nil? || @user != token.user
      render :invalid
    end
  end

  def update
    nonce = params[:nonce]
    @user = Token.consume(nonce)
    if @user
      @user.update_attributes(user_params)
      flash[:success] = "Your email preferences are saved!"
      redirect_to root_path
    else
      flash[:alert] = "Oops there was an error when updating your preferences. Try again!"
      render :invalid
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :marketing, :articles, :digest)
  end
end
