
class UsersController < ApplicationController 
    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        byebug
        if @user 
            flash[:message] = "Username already taken"
            redirect_to new_user_path
        elsif !@user 
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
    end

    def update 
    end

    def destroy
    end

    private

    def user_params
        #remember to put everything in permit
        params.require(:user).permit(:first_name,:last_name,:user_name, :age,:email,:admin, :password, :id)
    end
end