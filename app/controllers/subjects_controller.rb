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
      @author = Author.find(params[:id])
      @posts = @author.posts
      render template: 'textbooks/index'
    end

    def textbook 
      @author = Author.find(params[:id])
      @post = Post.find(params[:post_id])
      render template: 'textbooks/show'
    end

    def textbook_create
      @author = Author.find(params[:id])
      @post = Post.find(params[:id])
      render template 'textbooks/create'
    end

    private 

        def subject_params
         params.require(:subject).permit(:name, :credits, :user_id, :attraction_id)
        end
end