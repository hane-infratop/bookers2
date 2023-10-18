class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(params[:user_id])
    book.save
    redirect_to book_path(book.id)
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    redirect_to '/books'
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
