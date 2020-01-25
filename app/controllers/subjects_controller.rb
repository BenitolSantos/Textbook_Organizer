class SubjectsController < ApplicationController
    def index 
      @user = User.find_by(id: session[:user_id])
      @subjects = Subject.all
    end

    def new
      @subject = Subject.new 
    end

    def create
       @user = User.find_by(id: session[:user_id])
        @subject = Subject.create(subject_params)
        @subject.users << @user
        redirect_to subject_path(@subject)
    end

    def edit 
     @user = User.find_by(id: session[:user_id])
     @subject = Subject.find(params[:id])
    end

    def update
      @user = User.find_by(id: session[:user_id])
     @subject = Subject.find(params[:id])
    end

    def show 
      @subject = Subject.find(params[:id])
      @user = User.find_by(id: session[:user_id])
      @subject_textbooks = @subject.textbooks
      @textbooks = Textbook.all
      @textbook = Textbook.new
      #nested form renders current page views useless.
      #also more DRY and simple.
      #no conditionals for seperate current_page views
    end

    def textbooks_index 
      @subject = subject.find(params[:id])
      @textbooks = @subject.textbooks
      render template: 'textbooks/index'
    end

    def textbook 
      @subject = Subject.find(params[:id])
      @textbook = Textbook.find(params[:subject_id])
      render template: 'textbooks/show'
    end

    def textbook_new 
      @subject = Subject.find(params[:id])
      @textbook = Textbook.find(params[:subject_id])
      render template: 'textbooks/new'
    end

    private 

        def subject_params
         params.require(:subject).permit(:name)
        end
end