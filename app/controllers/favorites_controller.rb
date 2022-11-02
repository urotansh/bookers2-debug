class FavoritesController < ApplicationController
  
  def create
    favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    favorite.save
    
    # *.js.erbで参照するインスタンス
    @book = Book.find(params[:book_id])
    # スコープの設定 favoritesテーブルからcreated_atが1週間以内のデータのみ取得してpreload(キャッシュ)する
    ActiveRecord::Associations::Preloader.new.preload(@book, :favorites, Favorite.where(created_at: ((Time.current.at_end_of_day - 6.day).at_beginning_of_day)..(Time.current.at_end_of_day)))
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    favorite.destroy
    
    # *.js.erbで参照するインスタンス
    @book = Book.find(params[:book_id])
    # スコープの設定 favoritesテーブルからcreated_atが1週間以内のデータのみ取得してpreload(キャッシュ)する
    ActiveRecord::Associations::Preloader.new.preload(@book, :favorites, Favorite.where(created_at: ((Time.current.at_end_of_day - 6.day).at_beginning_of_day)..(Time.current.at_end_of_day)))
  end
  
end
