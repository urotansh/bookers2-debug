class BookCommentsController < ApplicationController
  
  def create
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = params[:book_id]
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
