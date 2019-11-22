class CurrentPagesController < ApplicationController  
    def index 
        @user = User.find_by_id(session[:user_id])
        @current_pages = Current_Page.all
    end

    def new
    end

    def create
        @current_page = Current_Page.create(current_pages)
        redirect_to current_page_path(@current_pages)
    end

    def edit
        @current_page = Current_Page.find(params[:id])
        @user = User.find_by(id: session[:user_id])
    end

    def update 
        @current_page = Current_Page.find(params[:id])
        @current_page.update(attraction_params)
        redirect_to current_page_path(@current_page)
    end

    def destroy
        @current_page.destroy
        redirect_to textbook_path
    end

    private
        
        def current_page_params
            params.require(:current_page).permit(:page_num,:chapter_num,:user_id,:textbook_id)
        end

end