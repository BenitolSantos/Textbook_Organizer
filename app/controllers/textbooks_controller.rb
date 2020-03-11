class TextbooksController < ApplicationController
    def index
        @user = User.find_by(id: session[:user_id])
        if params[:subject_id]
            @textbooks = Subject.find(params[:subject_id]).textbooks
        else
            @textbooks = Textbook.all
        end
    end

    #we're going to only let admins be able to create books
    #and users take out books
    #changed due to mvp and time crunch
    def new
        @user = User.find_by(id: session[:user_id])
        @subject = Subject.find_by(id: params[:subject_id])
        #if @user.admin   
        if params[:subject_id]
            @textbook = Textbook.new
        end
        #else
         #flash[:message] = "Only Admins can make new textbooks"
         #redirect_to subject_path(@subject) 
        #end
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @subject = Subject.find_by(id: params[:subject_id])
        #if @user.admin
         @textbook = Textbook.create(textbook_params)
         @subject.textbooks << @textbook
         @subject.save
         @inexpensive_textbook = Textbook.inexpensive
         @expensive_textbook = Textbook.expensive
         redirect_to subject_path(@subject)
        #else
         #flash[:message] = "Only Admins can make new textbooks"
         #redirect_to subject_path(@subject)
        #end  
    end

    def edit 
        @user = User.find_by(id: session[:user_id]) 
        #if @user.admin
            @textbook = Textbook.find(params[:id])
       # else 
        #    flash[:message] = "Only admins can edit books"
            #ridirect_to textbooks_path
        #end
    end

    def update
        @textbook = Textbook.find(params[:id])
        redirect_to textbook_path(@textbook)
    end

    def show 
        @textbook = Textbook.find_or_create_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        #nested form renders current page views useless.
        #also more DRY and simple.
        #no conditionals for seperate current_page views
    end

    def destroy
        @user = User.find_by(id: session[:user_id])
        #if @user.admin #delete from all textbooks
          @textbook = Textbook.find(params[:id])
          @textbook.destroy
        #else #delete from student's list of textbooks
         # @user.subjects.each do |subject|
          #  @textbook = subject.textbooks.find(textbook_id: params[:id])
           # @textbook.destroy
          #end
        #end
        redirect_to textbooks_path
    end



    private 

        def textbook_params
         params.require(:textbook).permit(:title,:description,:pages,:cost, :subject_id)
        end
end