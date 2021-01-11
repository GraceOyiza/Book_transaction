class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
        #   logged_in?(@user)
        #    session[creator_id] = @user.id
          flash[:success] = 'You have signed up successfully'
          redirect_to user_path(@user)
        else
            puts @user.errors.full_messages, 'ERRORS!!!!!!!!!'

          flash[:danger] = 'Oops! Something went wrong!'
          render 'new'
        end
      end

      def show
        redirect_to books_path
      end


     def destroy
        @user = User.find( params[:id] )
        if @user.destroy
          flash[:info] = "Are you sure you wanna do this"
        else
          flash[:danger] = 'Oops! Something went wrong!'
        end
        redirect_to root_path
    end
end
