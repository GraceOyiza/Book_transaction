class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
      @books = current_user.books.desc_group
    end
  
    def new
      @book =  current_user.books.build
    end
  
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
          flash[:notice] = 'Book created successfully'
          redirect_to root_path
        else
          render :new
        end
    end

    def edit
        @book = Book.find(params[:id])
    end
        
    def update
        @book = Book.find(params[:id])
           if @book.update(book_params)
               flash[:success] = "Book name was successfully updated"
               redirect_to book_path(@book)
           else
              render 'edit'
           end
     end
  
    def show; end

  
    def destroy
      if @book
        @book.destroy
        flash[:notice] = 'Book deleted successfully! What a Pity...'
      else
        flash[:alert] = 'Book not found! Do you know what you are searching for!'
      end
      redirect_to books_path
    end
  
   

end
