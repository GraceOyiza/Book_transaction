class SessionsController < ApplicationController
  # skip_before_action :authenticate_user
  def new; end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
      redirect_to books_path
    else
      flash.now[:danger] = 'Invalid username'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success] = 'Logged out successfully'
    render :new
  end
end
