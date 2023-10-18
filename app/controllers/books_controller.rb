class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(params[:user_id])
    book.save
    redirect_to user_path(current_user)
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
