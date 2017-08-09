class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Defines current user for a session
  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # Logs in a user
  def login(user)
    if user
      session[:current_user_id] = user.id
    end
  end

  # Logs out a user
  def logout
    session[:current_user_id] = nil
  end
end
