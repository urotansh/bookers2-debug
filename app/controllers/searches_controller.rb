class SearchesController < ApplicationController
  
  def search
    @keyword = params[:name]
    search = params[:search]
    
    if @keyword.present?
      # 完全一致検索
      if search == "perfect_match"
        @users = User.where(name: @keyword)
      # 前方一致検索
      elsif search == "forward_match"
        @users = User.where('name LIKE ?', "#{@keyword}%")
      # 後方一致検索
      elsif search == "backward_match"
        @users = User.where('name LIKE ?', "%#{@keyword}")
      # 部分一致検索
      elsif search == "partial_match"
        @users = User.where('name LIKE ?', "%#{@keyword}%")
      # それ以外
      else
        @users = User.none
      end
    else
      @users = User.none
    end
  end
  
end
