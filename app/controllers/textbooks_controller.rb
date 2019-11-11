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
    end


    private 

        def textbook_params
         params.require(:ride).permit(:user_id, :attraction_id)
        end
end