class UsersController < ApplicationController
  def show
    # checking to see if anoynmous user with token and email param in URL
    if current_user.nil? && params[:token] && params[:email]
      @user = Token.consume(params[:token])
      # checking to see if the user's email matches the email param
      if @user && @user.email == params[:email]
        login(@user)
      else
        # avoid double-render error
        return render :invalid
      end
    else
      # if user has been to the page, the set user to current_user
      @user = current_user
    end
    # if user is nil, not logged in, or the params are incorrect, then handle
    if @user.nil?
      render :invalid
    end
  end

  def update
    @user = current_user
    if @user
      @user.update_attributes(user_params)
      flash[:success] = "Your email preferences are saved!"
      render :show
    else
      flash[:alert] = "Oops there was an error when updating your preferences. Try again!"
      render :invalid
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :marketing, :articles, :digest)
  end
end
