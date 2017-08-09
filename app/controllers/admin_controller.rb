class AdminController < ApplicationController
  def index
    logout
    @users = User.all
  end

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
      render :new
    end
  end

  def create
    if current_user
      redirect_to root_path
    else
      user = User.new(admin_params)
      if user.save
        session[:current_user_id] = user.id
        redirect_to email_preferences_path
      else
        render :invalid
      end
    end
  end

  def delete
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def generate_token
    u = User.find(params[:id])
    Token.generate(u)
    redirect_to root_path
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :name, :marketing, :articles, :digest)
  end
end
