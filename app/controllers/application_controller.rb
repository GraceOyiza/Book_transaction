class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    # @current_user ||= (User.find(session[:user_id]) if session[:user_id])
    User.includes(:books, :groups).where(id: session[:user_id]).first
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user!
    redirect_to login_path unless logged_in?
  end
end
