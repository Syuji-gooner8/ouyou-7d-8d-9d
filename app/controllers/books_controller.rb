class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_current_user, {only: [:edit,:update,:destroy]}

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
    @book_comment = BookComment.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = (current_user.id)
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      flash[:notice] = "error"
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def ensure_current_user
      @book = Book.find(params[:id])
     if @book.user_id != current_user.id
        redirect_to books_path
     end
  end

  def book_params
    params.require(:book).permit(:title, :body, :image, :star)
  end

end
