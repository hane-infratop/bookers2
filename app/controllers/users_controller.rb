class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def edit
  end
end
