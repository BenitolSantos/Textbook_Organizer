class CurrentPagesController < ApplicationController  
    def new
    end

    def create
        @current_page = Current_Page.create(current_pages)
        redirect_to user_path(@current_pages.user)
    end

    private
        
        def current_page_params
            params.require(:current_page).permit(:page_num,:chapter_num,:user_id,:textbook_id)
        end

end