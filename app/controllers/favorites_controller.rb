class FavoritesController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    favorite.save
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    favorite.destroy
  end
  
end
