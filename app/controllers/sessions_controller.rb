class SessionsController < ApplicationController  
    def new
     @user = User.new
     @users = User.all
    end

    def create
      @user = User.find_by(:user_name => user_params[:user_name])
      return head(:forbidden) unless @user.authenticate(user_params[:password])
      if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else 
        flash[:message] = "User or Password incorrect"
        redirect_to new_user_path(@user)
      end
    end

    def destroy
        session.delete(:user_id) 
        redirect_to root_path
    end

    private 

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end