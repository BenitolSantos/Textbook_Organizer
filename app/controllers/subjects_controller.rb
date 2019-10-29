class SubjectsController < ApplicationController
    def new   
    end

    def create
        @ride = Ride.create(ride_params)
        flash[:message] = @ride.take_ride
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