class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    @book_favorite.save
    render 'favorite.js.erb'
    #redirect_to book_path(params[:book_id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @book_favorite.destroy
    render 'favorite.js.erb'
    #redirect_to book_path(params[:book_id])
  end
end
