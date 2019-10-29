class TextbooksController < ApplicationController
    def new   
    end

    def create 
        @textbook = Textbook.create(textbook_params)
        flash[:message] = @textbook.take_ride
        redirect_to user_path(@ride.user)
    end

    def edit 
    end

    def update
    end


    private 

        def ride_params
         params.require(:ride).permit(:user_id, :attraction_id)
        end
end