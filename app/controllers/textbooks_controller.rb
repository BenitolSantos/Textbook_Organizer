class TextbooksController < ApplicationController
    def index 
        @textbooks = Textbook.all
        @user = User.find_by(id: session[:user_id])
    end

    #we're going to only let admins be able to create books
    #and users take out books
    def new
        @user = User.find_by(id: session[:user_id])
        if @user.admin
         @textbook = Textbook.new
        else 
         @textbooks = @textbooks.all
        end
    end

    def create 
        @user = User.find_by(id: session[:user_id])
        if @user.admin
         @textbook = Textbook.create(textbook_params)
        else
         @textbook = Textbook.find_by(id: session[:user_id])
        end
        redirect_to user_path(@user)
    end

    def edit 
        @user = User.find_by(id: session[:user_id])
        if @user.admin
            @textbook = Textbook.find(params[:id])
        else 
            flash[:message] = "Only admins can edit books"
            ridirect_to textbooks_path
        end
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
        @user = User.find_by(id: session[:user_id])
        if @user.admin #delete from all textbooks
          @textbook = Textbook.find(params[:id])
          @textbook.destroy
        else #delete from student's list of textbooks
          @user.subjects.each do |subject|
            @textbook = subject.textbooks.find(textbook_id: params[:id])
            @textbook.destroy
          end
        end
        redirect_to textbooks_path
    end



    private 

        def textbook_params
         params.require(:textbook).permit(:title,:description,:pages,:cost)
        end
end