class SessionsController < ApplicationController
    
        def new; end


        def create
          @user = User.find_by_username(params[:username])
          if @user
            session[:user_id] = user.id
            flash[:success] = "Welcome #{@user.username}"
            redirect_to books_path
          else
            flash.now[:danger] = 'Login in to continue.'
            render :new
          end
        end
       
      
        def destroy
          session[:user_id] = nil
          flash.now[:notice] = 'Logged out successfully'
          render :new
        end
end
