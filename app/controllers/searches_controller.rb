class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "/searches/result"
    else
      @books = Book.looks(params[:search], params[:word])
      render "/searches/result"
    end
  end
  def result
  end
end



