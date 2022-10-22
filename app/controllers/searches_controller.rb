class SearchesController < ApplicationController
  
  def search
    @keyword = params[:keyword]
    target = params[:target]
    search = params[:search]
    obj = Object.const_get(target)
    
    # カラム名の設定
    if obj.name == "User"
      column = "name"
    elsif obj.name == "Book"
      column = "title"
    else
      redirect_to request.referer
    end
    
    if @keyword.present?
      # 完全一致検索
      if search == "perfect_match"
        @results = obj.where("#{column}": @keyword)
      # 前方一致検索
      elsif search == "forward_match"
        @results = obj.where("#{column} LIKE ?", "#{@keyword}%")
      # 後方一致検索
      elsif search == "backward_match"
        @results = obj.where("#{column} LIKE ?", "%#{@keyword}")
      # 部分一致検索
      elsif search == "partial_match"
        @results = obj.where("#{column} LIKE ?", "%#{@keyword}%")
      # それ以外
      else
        @results = obj.none
      end
    else
      @results = obj.none
    end
  end
  
end
