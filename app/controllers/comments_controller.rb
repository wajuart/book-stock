class CommentsController < ApplicationController
  def create
    # @comment = Comment.create(comment_params)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
    # respond_to do |format|
      # redirect_to "/books/#{comment.book.id}"
      # format.html { redirect_to book_path(params[:book_id])  }
      # format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end
