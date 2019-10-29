class CurrentPagesController < ApplicationController  
    def index 
        @user = User.find_by_id(session[:user_id])
        @attractions = Attraction.all
    end

    def new 
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find_by(id: session[:user_id])
        @ride = Ride.new(:attraction_id => @attraction.id, :user_id => @user.id) 
    end

    def edit
        @attraction = Attraction.find(params[:id])
        @user = User.find_by(id: session[:user_id])
    end

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def destroy
        @attraction.destroy
        redirect_to attractions_path
    end

    private
        
        def attraction_params
            params.require(:attraction).permit(:name,:min_height,:nausea_rating,:happiness_rating,:tickets,:admin)
        end

end