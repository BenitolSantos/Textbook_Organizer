require 'pry'
class SessionsController < ApplicationController  
    def new
     @user = User.new
     @users = User.all
    end

    def create
      @user = User.find_by(:user_name => user_params[:user_name]) 
          #do I need to remake my user model based on what auth info has has inside?
          #can I just redirect to new user form with the user_name and email?
          #facebook omniauth doesn't have enough info
      if @user
      #return head(:forbidden) unless @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      elsif
        flash[:message] = "User or Password incorrect"
        redirect_to new_user_path(@user)
      end
    end


    def fb_create #Ayana suggested a second create path for facebook since it's so different
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.user_name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end 
      session[:user_id] = @user.id 
      if session[:user_id]
      redirect_to user_path(@user)
      else 
        flash[:message] = "Authentication Error. Try again!"
        ridirect_to new_user_path(@user)
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