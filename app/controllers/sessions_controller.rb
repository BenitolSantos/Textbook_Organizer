class SessionsController < ApplicationController  
    def new
     @user = User.new
     @users = User.all
    end

    def create
        byebug
      @user = User.find_by(:user_name => params[:user][:user_name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
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