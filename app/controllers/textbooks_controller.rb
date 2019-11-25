class TextbooksController < ApplicationController
    def new   
        @textbook = Textbook.new
    end

    def create 
        @textbook = Textbook.create(textbook_params)
        flash[:message] = @textbook.take_ride
        redirect_to user_path(@textbook.user)
    end

    def edit 
        @textbook = Textbook.find(params[:id])
    end

    def update
        @textbook = Textbook.find(params[:id])
    end

    def show 
        @textbook = Textbook.find(params[:id])
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
         params.require(:ride).permit(:user_id, :attraction_id)
        end
end