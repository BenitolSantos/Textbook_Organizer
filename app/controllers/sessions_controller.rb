class SessionsController < ApplicationController  
    def new
     @user = User.new
     @users = User.all
    end

    def create
      if user_params[:user_name]
      @user = User.find_by(:user_name => user_params[:user_name])
      #binding.pry
      elsif auth['uid']
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.user_name = auth['info']['name']
          u.email = auth['info']['email']
          redirect_to new_user_path(@user)
          #do I need to remake my user model based on what auth info has has inside?
          #can I just redirect to new user form with the user_name and email?
          #facebook omniauth doesn't have enough info
      end

      if @user
      #return head(:forbidden) unless @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      elsif
        flash[:message] = "User or Password incorrect"
        redirect_to new_user_path(@user)
      end
    end

    def destroy
        reset_session
        redirect_to root_path
        #testing if this works
    end

    private

    def auth 
      request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end