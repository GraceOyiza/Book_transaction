class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %i[show destroy edit update]

  def index
    @books = current_user.books.order('title ASC').select { |item| item.groups.exists? }
  end

  def new
    @book = Book.new
    @groups = current_user.groups
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      flash[:success] = 'Book created successfully'
      p @book, 'Created book', @book.groups
      return redirect_to external_books_path if @book.groups.first.nil?

      # redirect_to book_path(@book)
      redirect_to books_path
    else
      render :new
    end
  end

  def external
    @books = current_user.books.order('title ASC').reject { |book| book.groups.exists? }
  end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:success] = 'Book name was successfully updated'
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def external_transaction
    @books = current_user.books.desc_no_group
  end

  def destroy
    if @book.destroy
      flash[:notice] = 'Book deleted successfully! What a Pity...'
    else
      flash[:alert] = 'Book not found! Do you know what you are searching for!'
    end
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :amount, group_ids: [])
  end

  def set_book
    @book = Book.includes(:groups, :creator).find(params[:id])
  end
end
