class SubjectsController < ApplicationController
    def new  
      @subject = Subject.new 
    end

    def create
        @subject = Subject.create(subject_params)
        redirect_to user_path(@ride.user)
    end

  def edit 
  end

  def update
  end


    private 

        def subject_params
         params.require(:subject).permit(:name, :credits, :user_id, :attraction_id)
        end
end