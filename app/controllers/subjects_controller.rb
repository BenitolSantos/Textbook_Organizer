class SubjectsController < ApplicationController
    def new  
      @subject = Subject.new 
    end

    def create
        @subject = Subject.create(subject_params)
        redirect_to user_path(@subject.user)
    end

  def edit 
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
  end


    private 

        def subject_params
         params.require(:subject).permit(:name, :credits, :user_id, :attraction_id)
        end
end