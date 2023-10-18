class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @book = Book.new
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def edit
    book = Book.find(params[:id])
    unless book.id == current_user.id
      redirect_to books_path
    end
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(book.id)
    else
      flash[:notice] = "errors prohibited this obj from being saved:"
      @book = Book.find(params[:id])
      render :edit
    end
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
