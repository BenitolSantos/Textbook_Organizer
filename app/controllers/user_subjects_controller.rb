
require 'pry'
class UserSubjectsController < ApplicationController 
    def new
        @user_subject = User.new
    end

    def create #byebug is bad
        #use pry
        @user = User.find_by(:user_name => user_params[:user_name])

        if @user 
            flash[:message] = "Username already taken"
            redirect_to new_user_path
        elsif @user == nil
            @user = User.create(user_params)
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end
    end

    def show
        @user = User.find(params[:id])
        if session[:user_id] == nil 
          flash[:message] = "Please login."
          redirect_to root_path
        elsif session[:user_id] != @user.id
          flash[:message] = "Please access your details only."
          redirect_to root_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to signout_path
    end

    private

    def user_params
        #remember to put everything in permit
        params.require(:user).permit(:first_name,:last_name,:user_name, :age,:email,:admin, :password, :id)
    end
end