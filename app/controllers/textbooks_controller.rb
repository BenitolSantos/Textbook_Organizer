class TextbooksController < ApplicationController
    def index 
        @textbooks = Textbook.all
        @user = User.find_by(id: session[:user_id])
    end

    #we're going to only let admins be able to create books
    #and users take out books
    def new
        @user = User.find_by(id: session[:user_id])
        @textbook = Textbook.new
    end

    def create 
        @textbook = Textbook.create(textbook_params)
        @user = User.find_by(id: session[:user_id])
        redirect_to user_path(@user)
    end

    def edit 
        @textbook = Textbook.find(params[:id])
    end

    def update
        @textbook = Textbook.find(params[:id])
    end

    def show 
        @textbook = Textbook.find(params[:id])
        @user = User.find_by(id: session[:user_id])
        #nested form renders current page views useless.
        #also more DRY and simple.
        #no conditionals for seperate current_page views
    end

    def destroy
        @textbook = User.find(params[:id])
        @textbook.destroy
        redirect_to textbooks_path
    end



    private 

        def textbook_params
         params.require(:textbook).permit(:title,:description,:pages,:cost)
        end
end