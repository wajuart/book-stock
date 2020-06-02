class LikesController < ApplicationController
  # ⑦
  # before_action :set_book

  def create
    # ①
    # @like = current_user.likes.create(book_id: params[:post_id])
    # redirect_back(fallback_location: root_path)
    # ②
    # @like = Like.create(user_id: current_user.id, book_id: params[:book_id])
    # @likes = Like.where(book_id: params[:book_id])
    # @books = Book.all
    # ③
    # @like = Like.new(user_id: @current_user.id, book_id: params[:book_id])
    # @like.save
    # @book = Book.find_by(id: @like.book_id)
    # @like_count = Like.where(book_id: params[:book_id]).count
    #④
    # @like = Like.create(user_id: current_user.id, book_id: params[:book_id])
    # @likes = Like.where(book_id: params[:book_id])
    # get_book
    #⑤
    # like = current_user.likes.build(book_id: params[:book_id])
    # like.save
    # redirect_to books_path
    # ⑥
    # @like = Like.new(user_id: @current_user.id, book_id: params[:book_id])
    # @like.save
    # redirect_to("/books/#{params[:book_id]}")
    # ⑦
    # @like = Like.create(user_id: current_user.id, book_id: @book.id)
    # ⑧
    # @book = Book.find(params[:book_id])
    # @like = Like.create(user_id: current_user.id, book_id: params[:book_id])
    # @book.reload

    # ⑨
    like = Like.new #Likeクラスのインスタンスを作成
    like.user_id = current_user.id #current_userのidを変数に代入
    like.book_id = params[:book_id]

    if like.save #likeが保存できているかどうかで条件分岐
      redirect_to books_path, notice: 'いいねしました'
    else
      redirect_to books_path, alert: 'いいねに失敗しました'
    end

  end

  def destroy
    # ①
    # @like = Like.find_by(post_id: params[:book_id], user_id: current_user.id)
    # @like.destroy
    # redirect_back(fallback_location: root_path)
    # ②
    # like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    # like.destroy
    # @likes = Like.where(book_id: params[:book_id])
    # @books = Book.all
    # ③
    # @like = Like.find_by(user_id: @current_user.id, book_id: params[:book_id])
    # @book = Book.find_by(id: @like.book_id)
    # @like.destroy
    # @like_count = Like.where(book_id: params[:book_id]).count
    # ④
    # @like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    # @like.destroy
    # @likes = Like.where(book_id: params[:book_id])
    # get_book
    # ⑤
    # like = Like.find_by(book_id: params[:book_id], user_id: current_user.id)
    # like.destroy
    # redirect_to books_path
    # ⑥
    # @like = Like.find_by(user_id: @current_user.id, book_id: params[:book_id])
    # @like.destroy
    # redirect_to("/books/#{params[:book_id]}")
    # ⑦
    # @like = Like.find_by(user_id: current_user.id, book_id: @book.id)
    # @like.destroy
    # ⑧
    # @book = Book.find(params[:book_id])
    # @like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    # @like.destroy
    # @book.reload

    # ⑨
    @like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    @like.destroy
    redirect_to books_path, success: 'いいねを取り消しました'

  end

  def get_book
    @book = Book.find(params[:book_id])
  end

  # ⑦
  # private
  # def set_book
  #   @book = Book.find(params[:book_id])
  # end

end
