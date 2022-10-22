class SearchesController < ApplicationController
  
  def search
    @users = User.where('name LIKE ?', "%#{params[:name]}%")
    @keyword = params[:name]
  end
  
end
