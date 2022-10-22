class SearchesController < ApplicationController
  
  def search
    @keyword = params[:name]
    
    if @keyword.present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
end
